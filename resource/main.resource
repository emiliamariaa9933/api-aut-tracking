*** Settings ***
Library  String
Library  Collections
Library  OperatingSystem
Library  RequestsLibrary
Library  JSONLibrary
Library  JsonValidator

# utils
# Resource    ${EXECDIR}/resource/utils/gherkin_ptbr.robot

# APIs e endpoints
Resource  ${EXECDIR}/resource/API/index_ambiente.resource
Resource  ${EXECDIR}/resource/API/index_api_edps_trackings.resource

# Massa de dados
Resource  ${EXECDIR}/resource/data/index_bodies.resource

# Keywords
Resource  ${EXECDIR}/resource/keywords/api_trackings/post_create_tracking.robot
Resource  ${EXECDIR}/resource/keywords/common/kws_shared.robot