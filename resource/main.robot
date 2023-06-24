*** Settings ***
## 1.0.5
##########################################################################
#                                 Libraries                              #
##########################################################################

 

Library  SeleniumLibrary
Library  RequestsLibrary
Library  OperatingSystem
Library  Collections
Library  DateTime
Library  String
Library  ArchiveLibrary

##########################################################################
#                                 Resources                              #
##########################################################################

Variables  ./environments/env.${AMBIENTE}.yaml
Variables  ./environments/env.prod.yaml

##########################################################################
#                                 Keywords                               #
##########################################################################

Resource  ./keywords/global.robot
Resource  ./keywords/testes.robot



##########################################################################
#                                 Elementos                              #
##########################################################################


*** Variables ***
${AMBIENTE}  prod
${download_folder}  ${EXECDIR}${/}resources${/}temp