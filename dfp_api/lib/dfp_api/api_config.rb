#!/usr/bin/env ruby
# Encoding: utf-8
#
# Authors:: api.dklimkin@gmail.com (Danial Klimkin)
#
# Copyright:: Copyright 2011, Google Inc. All Rights Reserved.
#
# License:: Licensed under the Apache License, Version 2.0 (the "License");
#           you may not use this file except in compliance with the License.
#           You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#           Unless required by applicable law or agreed to in writing, software
#           distributed under the License is distributed on an "AS IS" BASIS,
#           WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
#           implied.
#           See the License for the specific language governing permissions and
#           limitations under the License.
#
# Helper methods for loading and managing the available services in the DFP
# API.

require 'ads_common/api_config'

require 'dfp_api/version'

module DfpApi

  # Contains helper methods for loading and managing the available services.
  module ApiConfig

    class << ApiConfig
      include AdsCommon::ApiConfig
    end

    # Set defaults
    DEFAULT_VERSION = :v201308
    DEFAULT_ENVIRONMENT = :PRODUCTION
    LATEST_VERSION = :v201308

    # Set other constants
    API_NAME = 'DfpApi'
    DEFAULT_CONFIG_FILENAME = 'dfp_api.yml'

    # Configure the services available to each version
    @@service_config = {
      :v201208 => [:CompanyService, :CreativeService, :ForecastService,
                   :InventoryService, :LineItemCreativeAssociationService,
                   :LineItemService, :NetworkService, :OrderService,
                   :PlacementService, :ReportService, :UserService,
                   :CustomTargetingService, :PublisherQueryLanguageService,
                   :LabelService, :ThirdPartySlotService, :ContentService,
                   :SuggestedAdUnitService, :CreativeTemplateService,
                   :TeamService, :AudienceSegmentService, :CustomFieldService,
                   :UserTeamAssociationService, :CreativeSetService],
      :v201211 => [:CompanyService, :CreativeService, :ForecastService,
                   :InventoryService, :LineItemCreativeAssociationService,
                   :LineItemService, :NetworkService, :OrderService,
                   :PlacementService, :ReportService, :UserService,
                   :CustomTargetingService, :PublisherQueryLanguageService,
                   :LabelService, :ThirdPartySlotService, :ContentService,
                   :SuggestedAdUnitService, :CreativeTemplateService,
                   :TeamService, :AudienceSegmentService, :CustomFieldService,
                   :UserTeamAssociationService, :CreativeSetService,
                   :CreativeWrapperService],
      :v201302 => [:CompanyService, :CreativeService, :ForecastService,
                   :InventoryService, :LineItemCreativeAssociationService,
                   :LineItemService, :NetworkService, :OrderService,
                   :PlacementService, :ReportService, :UserService,
                   :CustomTargetingService, :PublisherQueryLanguageService,
                   :LabelService, :ThirdPartySlotService, :ContentService,
                   :SuggestedAdUnitService, :CreativeTemplateService,
                   :TeamService, :AudienceSegmentService, :CustomFieldService,
                   :UserTeamAssociationService, :CreativeSetService,
                   :CreativeWrapperService, :ActivityGroupService,
                   :ActivityService, :AdRuleService, :ContactService,
                   :ContentBundleService],
      :v201306 => [:CompanyService, :CreativeService, :ForecastService,
                   :InventoryService, :LineItemCreativeAssociationService,
                   :LineItemService, :NetworkService, :OrderService,
                   :PlacementService, :ReportService, :UserService,
                   :CustomTargetingService, :PublisherQueryLanguageService,
                   :LabelService, :ContentService, :SuggestedAdUnitService,
                   :CreativeTemplateService, :TeamService,
                   :AudienceSegmentService, :CustomFieldService,
                   :UserTeamAssociationService, :CreativeSetService,
                   :CreativeWrapperService, :ActivityGroupService,
                   :ActivityService, :AdRuleService, :ContactService,
                   :ContentBundleService, :BaseRateService, :ProductService,
                   :ProductTemplateService, :ProposalService,
                   :ProposalLineItemService, :RateCardService,
                   :RateCardCustomizationService,
                   :ReconciliationOrderReportService,
                   :ReconciliationReportService,
                   :ReconciliationReportRowService,
                   :WorkflowActionService, :LineItemTemplateService],
      :v201308 => [:CompanyService, :CreativeService, :ForecastService,
                   :InventoryService, :LineItemCreativeAssociationService,
                   :LineItemService, :NetworkService, :OrderService,
                   :PlacementService, :ReportService, :UserService,
                   :CustomTargetingService, :PublisherQueryLanguageService,
                   :LabelService, :ContentService, :SuggestedAdUnitService,
                   :CreativeTemplateService, :TeamService,
                   :AudienceSegmentService, :CustomFieldService,
                   :UserTeamAssociationService, :CreativeSetService,
                   :CreativeWrapperService, :ActivityGroupService,
                   :ActivityService, :AdRuleService, :ContactService,
                   :ContentBundleService, :BaseRateService, :ProductService,
                   :ProductTemplateService, :ProposalService,
                   :ProposalLineItemService, :RateCardService,
                   :RateCardCustomizationService,
                   :ReconciliationOrderReportService,
                   :ReconciliationReportService,
                   :ReconciliationReportRowService,
                   :WorkflowActionService, :LineItemTemplateService]
    }

    # Configure the different environments, with the base URL for each one
    @@environment_config = {
      :PRODUCTION => {
        :oauth_scope => 'https://www.google.com/apis/ads/publisher/',
        :header_ns => 'https://www.google.com/apis/ads/publisher/',
        :v201208 => 'https://www.google.com/apis/ads/publisher/',
        :v201211 => 'https://www.google.com/apis/ads/publisher/',
        :v201302 => 'https://www.google.com/apis/ads/publisher/',
        :v201306 => 'https://www.google.com/apis/ads/publisher/',
        :v201308 => 'https://www.google.com/apis/ads/publisher/'
      }
    }

    # Auth constants for ClientLogin method.
    @@client_login_config = {
      :AUTH_SERVER => 'https://www.google.com',
      :LOGIN_SERVICE_NAME => 'gam'
    }

    public

    # Getters for constants and module variables.
    def self.default_version
      DEFAULT_VERSION
    end

    def self.default_environment
      DEFAULT_ENVIRONMENT
    end

    def self.latest_version
      LATEST_VERSION
    end

    def self.api_name
      API_NAME
    end

    def self.service_config
      @@service_config
    end

    def self.environment_config(environment, key)
      return @@environment_config.include?(environment) ?
          @@environment_config[environment][key] : nil
    end

    def self.subdir_config
      nil
    end

    def self.client_login_config(key)
      return @@client_login_config[key]
    end

    def self.default_config_filename
      DEFAULT_CONFIG_FILENAME
    end
  end
end
