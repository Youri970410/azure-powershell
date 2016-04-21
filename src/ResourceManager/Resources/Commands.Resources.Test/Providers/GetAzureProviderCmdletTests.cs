﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

namespace Microsoft.Azure.Commands.Resources.Test
{
    using Microsoft.Azure.Commands.ResourceManager.Cmdlets.Implementation;
    using Microsoft.Azure.Commands.ResourceManager.Cmdlets.SdkClient;
    using Microsoft.Azure.Commands.ResourceManager.Cmdlets.SdkModels;
    using Microsoft.Azure.Commands.Resources.Models;
    using Microsoft.Azure.Management.Resources;
    using Microsoft.Azure.Management.Resources.Models;
    using Microsoft.Rest.Azure;
    using Microsoft.WindowsAzure.Commands.ScenarioTest;
    using Moq;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Management.Automation;
    using System.Net;
    using System.Threading;
    using System.Threading.Tasks;
    using WindowsAzure.Commands.Test.Utilities.Common;
    using Xunit;

    /// <summary>
    /// Tests the AzureProvider cmdlets
    /// </summary>
    public class GetAzureProviderCmdletTests : RMTestBase
    {
        /// <summary>
        /// An instance of the cmdlet
        /// </summary>
        private readonly GetAzureProviderCmdletTest cmdlet;

        /// <summary>
        /// A mock of the command runtime
        /// </summary>
        private readonly Mock<ICommandRuntime> commandRuntimeMock;

        /// <summary>
        /// A mock of the client
        /// </summary>
        private readonly Mock<IProvidersOperations> providerOperationsMock;
        /// <summary>
        /// Initializes a new instance of the <see cref="GetAzureProviderCmdletTests"/> class.
        /// </summary>
        public GetAzureProviderCmdletTests()
        {
            this.providerOperationsMock = new Mock<IProvidersOperations>();
            var resourceManagementClient = new Mock<IResourceManagementClient>();

            resourceManagementClient
                .SetupGet(client => client.Providers)
                .Returns(() => this.providerOperationsMock.Object);

            this.commandRuntimeMock = new Mock<ICommandRuntime>();
            this.cmdlet = new GetAzureProviderCmdletTest
            {
                CommandRuntime = commandRuntimeMock.Object,
                ResourceManagerSdkClient = new ResourceManagerSdkClient
                {
                    ResourceManagementClient = resourceManagementClient.Object
                }
            };
        }

        /// <summary>
        /// Validates all Get-AzureRmResourceProvider parameter combinations
        /// </summary>
        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void GetsResourceProviderTests()
        {
            // setup return values
            const string RegisteredProviderNamespace = "Providers.Test1";
            const string UnregisteredProviderNamespace = "Providers.Test2";

            const string ResourceTypeName = "TestResource1";

            var unregisteredProvider = new Provider
            {
                NamespaceProperty = UnregisteredProviderNamespace,
                RegistrationState = "Unregistered",
                ResourceTypes = new[]
                {
                    new ProviderResourceType
                    {
                        Locations = new[] {"West US", "East US", "South US"},
                        ResourceType = "TestResource2"
                    }
                }
            };

            var response = new AzureOperationResponse<IPage<Provider>>();
           

            var result = new List<Provider>            
            {
               new Provider
                    {
                        NamespaceProperty = RegisteredProviderNamespace,
                        RegistrationState = ResourcesClient.RegisteredStateName,
                        ResourceTypes = new[]
                        {
                            new ProviderResourceType
                            {
                                Locations = new[] { "West US", "East US" },
                                ResourceType = ResourceTypeName,
                            }
                        }
                    },
            };

            response.Body = (IPage<Provider>)result;

            this.providerOperationsMock
                .Setup(f => f.ListNextAsync(It.IsAny<string>(), It.IsAny<CancellationToken>()))
                .Returns(() => Task.FromResult((IPage<Provider>)result));

            // 1. List only registered providers
            this.commandRuntimeMock
                .Setup(m => m.WriteObject(It.IsAny<object>()))
                .Callback((object obj) =>
                {
                    Assert.IsType<PSResourceProvider[]>(obj);

                    var providers = (PSResourceProvider[])obj;
                    Assert.Equal(1, providers.Length);

                    var provider = providers.Single();
                    Assert.Equal(RegisteredProviderNamespace, provider.ProviderNamespace);
                    Assert.Equal(ResourcesClient.RegisteredStateName, provider.RegistrationState);

                    Assert.Equal(1, provider.ResourceTypes.Length);

                    var resourceType = provider.ResourceTypes.Single();
                    Assert.Equal(ResourceTypeName, resourceType.ResourceTypeName);
                    Assert.Equal(2, resourceType.Locations.Length);
                });

            this.cmdlet.ParameterSetOverride = GetAzureProviderCmdlet.ListAvailableParameterSet;

            this.cmdlet.ExecuteCmdlet();

            this.VerifyListCallPatternAndReset();

            // 2. List all providers
            this.cmdlet.ListAvailable = true;

            this.commandRuntimeMock
              .Setup(m => m.WriteObject(It.IsAny<object>()))
              .Callback((object obj) =>
              {
                  Assert.IsType<PSResourceProvider[]>(obj);
                  var providers = (PSResourceProvider[])obj;
                  Assert.Equal(2, providers.Length);
              });

            this.cmdlet.ExecuteCmdlet();

            this.VerifyListCallPatternAndReset();

            // 3. List a single provider by name
            this.cmdlet.ProviderNamespace = UnregisteredProviderNamespace;

            this.providerOperationsMock
              .Setup(f => f.GetAsync(It.IsAny<string>(), It.IsAny<CancellationToken>()))
              .Returns(() => Task.FromResult(unregisteredProvider));

            this.commandRuntimeMock
                .Setup(m => m.WriteObject(It.IsAny<object>()))
                .Callback((object obj) =>
                {
                    Assert.IsType<PSResourceProvider[]>(obj);

                    var providers = (PSResourceProvider[])obj;
                    Assert.Equal(1, providers.Length);

                    var provider = providers.Single();
                    Assert.Equal(UnregisteredProviderNamespace, provider.ProviderNamespace);
                });

            this.cmdlet.ParameterSetOverride = GetAzureProviderCmdlet.IndividualProviderParameterSet;

            this.cmdlet.ExecuteCmdlet();

            this.VerifyGetCallPatternAndReset();

            // 4. List only registered providers with location
            this.cmdlet.Location = "South US";
            this.cmdlet.ListAvailable = false;
            this.cmdlet.ProviderNamespace = null;

            this.commandRuntimeMock
                .Setup(m => m.WriteObject(It.IsAny<object>()))
                .Callback((object obj) =>
                {
                    Assert.IsType<PSResourceProvider[]>(obj);

                    var providers = (PSResourceProvider[])obj;
                    Assert.Equal(0, providers.Length);
                });

            this.cmdlet.ParameterSetOverride = GetAzureProviderCmdlet.ListAvailableParameterSet;

            this.cmdlet.ExecuteCmdlet();

            this.VerifyListCallPatternAndReset();

            // 5. List all providers
            this.cmdlet.ListAvailable = true;
            this.cmdlet.Location = "South US";
            this.cmdlet.ProviderNamespace = null;

            this.commandRuntimeMock
              .Setup(m => m.WriteObject(It.IsAny<object>()))
              .Callback((object obj) =>
              {
                  var providers = (PSResourceProvider[])obj;
                  Assert.Equal(0, providers.Length);

                  var provider = providers.Single();
                  Assert.Equal(UnregisteredProviderNamespace, provider.ProviderNamespace);

                  Assert.Equal(1, provider.ResourceTypes.Length);

                  var resourceType = provider.ResourceTypes.Single();
                  Assert.Equal(ResourceTypeName, resourceType.ResourceTypeName);
              });

            this.cmdlet.ExecuteCmdlet();

            this.VerifyListCallPatternAndReset();
        }

        /// <summary>
        /// Resets the calls on the mocks
        /// </summary>
        private void ResetCalls()
        {
            this.providerOperationsMock.ResetCalls();
            this.commandRuntimeMock.ResetCalls();
        }

        /// <summary>
        /// Verifies the right call patterns are made
        /// </summary>
        private void VerifyGetCallPatternAndReset()
        {
            this.providerOperationsMock.Verify(f => f.GetAsync(It.IsAny<string>(), It.IsAny<CancellationToken>()), Times.Once());
            this.providerOperationsMock.Verify(f => f.ListNextAsync(It.IsAny<string>(), It.IsAny<CancellationToken>()), Times.Never);
            this.commandRuntimeMock.Verify(f => f.WriteObject(It.IsAny<object>(), It.IsAny<bool>()), Times.Once());
            this.ResetCalls();
        }

        /// <summary>
        /// Verifies the right call patterns are made
        /// </summary>
        private void VerifyListCallPatternAndReset()
        {
            this.providerOperationsMock.Verify(f => f.ListNextAsync(It.IsAny<string>(), It.IsAny<CancellationToken>()), Times.Never);
            this.commandRuntimeMock.Verify(f => f.WriteObject(It.IsAny<object>(), It.IsAny<bool>()), Times.Once());

            this.ResetCalls();
        }

        /// <summary>
        /// Helper class that enables setting the parameter set name
        /// </summary>
        private class GetAzureProviderCmdletTest : GetAzureProviderCmdlet
        {
            /// <summary>
            /// Sets the parameter set name to return
            /// </summary>
            public string ParameterSetOverride { private get; set; }
        }
    }
}
