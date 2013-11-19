<?xml version="1.0" encoding="UTF-8"?>
<!--
  Copyright (c) 2013 – The MITRE Corporation
  All rights reserved. See LICENSE.txt for complete terms.
  
  This styleshseet has logic that can be reused by various components in the
  stix-to-html transformation.
 -->

<xsl:stylesheet 
    version="2.0"
    xmlns:stix="http://stix.mitre.org/stix-1"
    xmlns:cybox="http://cybox.mitre.org/cybox-2"
    
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    
    xmlns:stixCommon="http://stix.mitre.org/common-1"
    xmlns:indicator="http://stix.mitre.org/Indicator-2"
    xmlns:campaign="http://stix.mitre.org/Campaign-1"
    xmlns:incident="http://stix.mitre.org/Incident-1"
    xmlns:ta="http://stix.mitre.org/ThreatActor-1"
    xmlns:et="http://stix.mitre.org/ExploitTarget-1"
    xmlns:TTP="http://stix.mitre.org/TTP-1"
    xmlns:COA="http://stix.mitre.org/CourseOfAction-1"
    xmlns:capec="http://stix.mitre.org/extensions/AP#CAPEC2.5-1"
    xmlns:marking="http://data-marking.mitre.org/Marking-1"
    xmlns:tlpMarking="http://data-marking.mitre.org/extensions/MarkingStructure#TLP-1"
    xmlns:stixVocabs="http://stix.mitre.org/default_vocabularies-1"
    xmlns:cyboxCommon="http://cybox.mitre.org/common-2"
    xmlns:cyboxVocabs="http://cybox.mitre.org/default_vocabularies-2"
    xmlns:simpleMarking="http://data-marking.mitre.org/extensions/MarkingStructure#Simple-1"
    
    xmlns:ttp='http://stix.mitre.org/TTP-1'
    
    xmlns:cyboxEmail="http://cybox.mitre.org/objects#EmailMessageObject-2"
    >
    
    <xsl:output method="html" omit-xml-declaration="yes" indent="yes" media-type="text/html" version="4.0" />
    
    <xsl:template match="cybox:Properties[contains(@xsi:type,'EmailMessageObjectType')]" priority="1000">
        <div class="emailCustomTemplate">
            <!-- <img style="width: 200px; height: 200px;" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOmNjPSJodHRwOi8vd2ViLnJlc291cmNlLm9yZy9jYy8iIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIGlkPSJzdmc3MTA2IiBoZWlnaHQ9IjY4LjJwdCIgd2lkdGg9IjEwNS40cHQiIHZlcnNpb249IjEuMCI+CiA8ZGVmcyBpZD0iZGVmczMiPgogIDxsaW5lYXJHcmFkaWVudCBpZD0ibGluZWFyR3JhZGllbnQ2OTA3Ij4KICAgPHN0b3AgaWQ9InN0b3A2OTA5IiBzdG9wLWNvbG9yPSIjZGNlN2VjIiBvZmZzZXQ9IjAiLz4KICAgPHN0b3AgaWQ9InN0b3A2OTExIiBzdG9wLWNvbG9yPSIjODM5Mjk3IiBvZmZzZXQ9IjEiLz4KICA8L2xpbmVhckdyYWRpZW50PgogIDxsaW5lYXJHcmFkaWVudCBpZD0ibGluZWFyR3JhZGllbnQyNDMwIiB4MT0iNjQzLjYiIHhsaW5rOmhyZWY9IiNsaW5lYXJHcmFkaWVudDY5MDciIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIiB5MT0iMzkwLjE0IiBncmFkaWVudFRyYW5zZm9ybT0ibWF0cml4KDEuNTg0IDAgMCAuNjU4MjAgLTk0OS42OCAtMjE0Ljg3KSIgeDI9IjY0My42IiB5Mj0iNDY0Ljc0Ii8+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJsaW5lYXJHcmFkaWVudDI0MzMiIHgxPSIxMTQ3LjIiIHhsaW5rOmhyZWY9IiNsaW5lYXJHcmFkaWVudDY5MDciIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIiB5MT0iMTk4LjkiIGdyYWRpZW50VHJhbnNmb3JtPSJtYXRyaXgoLjkxMTk4IDAgMCAxLjE0MzIgLTk0OS42OCAtMjE0Ljg3KSIgeDI9IjExNDcuMiIgeTI9IjI2Mi4yMyIvPgogIDxsaW5lYXJHcmFkaWVudCBpZD0ibGluZWFyR3JhZGllbnQyNDM2IiB4MT0iMTA3Ni43IiB4bGluazpocmVmPSIjbGluZWFyR3JhZGllbnQ2OTA3IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeTE9IjIwMi4wMiIgZ3JhZGllbnRUcmFuc2Zvcm09Im1hdHJpeCguOTExOTggMCAwIDEuMTQzMiAtOTQ5LjY4IC0yMTUpIiB4Mj0iMTA3Ni43IiB5Mj0iMjU1LjUyIi8+CiAgPHJhZGlhbEdyYWRpZW50IGlkPSJyYWRpYWxHcmFkaWVudDI0NDIiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIiBjeT0iMzE2LjkxIiBjeD0iNzkyLjgxIiBncmFkaWVudFRyYW5zZm9ybT0ibWF0cml4KDEuMjgzOSAwIDAgLjgxMjA2IC05NDkuNjggLTIxNSkiIHI9IjkxLjQ2OCI+CiAgIDxzdG9wIGlkPSJzdG9wNjk0NSIgc3RvcC1jb2xvcj0iI2ZmZiIgb2Zmc2V0PSIwIi8+CiAgIDxzdG9wIGlkPSJzdG9wNjk0NyIgc3RvcC1jb2xvcj0iIzU4NTg1OCIgb2Zmc2V0PSIxIi8+CiAgPC9yYWRpYWxHcmFkaWVudD4KIDwvZGVmcz4KIDxyZWN0IGlkPSJyZWN0NzE0NSIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3R5bGU9ImNvbG9yOiMwMDAwMDAiIGhlaWdodD0iNzQuNjI1IiB3aWR0aD0iMTE3Ljk4IiBzdHJva2U9IiM2MTZiNmQiIHk9IjUuMDM5MSIgeD0iNi41OTYiIHN0cm9rZS13aWR0aD0iNC4xMjE2IiBmaWxsPSJ1cmwoI3JhZGlhbEdyYWRpZW50MjQ0MikiLz4KIDxwYXRoIGlkPSJwYXRoNzE1MyIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3R5bGU9ImNvbG9yOiMwMDAwMDAiIGQ9Im02LjU5NiA1LjExMzV2NjguODZsMC4wMzE4IDUuNjE2IDU4Ljk2Ni0zNy4yMzgtNTguOTM0LTM3LjIzOC0wLjA2NC0wLjAwMDV6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iNC4xMjE2IiBmaWxsPSJ1cmwoI2xpbmVhckdyYWRpZW50MjQzNikiLz4KIDxwYXRoIGlkPSJwYXRoNzE1NSIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3R5bGU9ImNvbG9yOiMwMDAwMDAiIGQ9Im0xMjQuNTggNS4yMzcxdjY4Ljg2bC0wLjAzIDUuNjE2LTU4Ljk2OC0zNy4yMzggNTguOTM4LTM3LjIzOCAwLjA2IDAuMDAwMXoiIHN0cm9rZT0iIzAwMCIgc3Ryb2tlLXdpZHRoPSI0LjEyMTYiIGZpbGw9InVybCgjbGluZWFyR3JhZGllbnQyNDMzKSIvPgogPHBhdGggaWQ9InBhdGg3MTU3IiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHlsZT0iY29sb3I6IzAwMDAwMCIgZD0ibTQ4Ljg4IDM5LjYzNWwtNDIuMjQ2IDQwLjAxNC0wLjAzMjMgMC4xMjhoMTE4bC0wLjA3LTAuMTI4LTQyLjI0Mi00MC4wMTRjLTEwLjY4NS0xMC4xMi0yMi40My0xMC4zOTgtMzMuNDA4IDB6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iNC4xMjE2IiBmaWxsPSJ1cmwoI2xpbmVhckdyYWRpZW50MjQzMCkiLz4KIDxwYXRoIGlkPSJwYXRoNzE0MyIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3R5bGU9ImNvbG9yOiMwMDAwMDAiIGQ9Im00OC44NTMgNDEuMTQ2bC00Mi4xOTktMzUuODg1LTAuMDMyLTAuMTE0NWgxMTcuODdsLTAuMDcgMC4xMTQ0LTQyLjE5NyAzNS44ODVjLTEwLjY3MiA5LjA3NS0yMi40MDUgOS4zMjQtMzMuMzcgMHoiIHN0cm9rZT0iIzAwMCIgc3Ryb2tlLXdpZHRoPSI0LjEyMTYiIGZpbGw9IiNjNmQyZDciLz4KIDxtZXRhZGF0YT4KICA8cmRmOlJERj4KICAgPGNjOldvcms+CiAgICA8ZGM6Zm9ybWF0PmltYWdlL3N2Zyt4bWw8L2RjOmZvcm1hdD4KICAgIDxkYzp0eXBlIHJkZjpyZXNvdXJjZT0iaHR0cDovL3B1cmwub3JnL2RjL2RjbWl0eXBlL1N0aWxsSW1hZ2UiLz4KICAgIDxjYzpsaWNlbnNlIHJkZjpyZXNvdXJjZT0iaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvbGljZW5zZXMvcHVibGljZG9tYWluLyIvPgogICAgPGRjOnB1Ymxpc2hlcj4KICAgICA8Y2M6QWdlbnQgcmRmOmFib3V0PSJodHRwOi8vb3BlbmNsaXBhcnQub3JnLyI+CiAgICAgIDxkYzp0aXRsZT5PcGVuY2xpcGFydDwvZGM6dGl0bGU+CiAgICAgPC9jYzpBZ2VudD4KICAgIDwvZGM6cHVibGlzaGVyPgogICA8L2NjOldvcms+CiAgIDxjYzpMaWNlbnNlIHJkZjphYm91dD0iaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvbGljZW5zZXMvcHVibGljZG9tYWluLyI+CiAgICA8Y2M6cGVybWl0cyByZGY6cmVzb3VyY2U9Imh0dHA6Ly9jcmVhdGl2ZWNvbW1vbnMub3JnL25zI1JlcHJvZHVjdGlvbiIvPgogICAgPGNjOnBlcm1pdHMgcmRmOnJlc291cmNlPSJodHRwOi8vY3JlYXRpdmVjb21tb25zLm9yZy9ucyNEaXN0cmlidXRpb24iLz4KICAgIDxjYzpwZXJtaXRzIHJkZjpyZXNvdXJjZT0iaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvbnMjRGVyaXZhdGl2ZVdvcmtzIi8+CiAgIDwvY2M6TGljZW5zZT4KICA8L3JkZjpSREY+CiA8L21ldGFkYXRhPgo8L3N2Zz4K" /> -->
            <div style="height: 20em; width: 100em; border-color: red; border-style: solid; border-width: thin; padding: 0.2 em; background-repeat: no-repeat; background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOmNjPSJodHRwOi8vd2ViLnJlc291cmNlLm9yZy9jYy8iIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIGlkPSJzdmc3MTA2IiBoZWlnaHQ9IjY4LjJwdCIgd2lkdGg9IjEwNS40cHQiIHZlcnNpb249IjEuMCI+CiA8ZGVmcyBpZD0iZGVmczMiPgogIDxsaW5lYXJHcmFkaWVudCBpZD0ibGluZWFyR3JhZGllbnQ2OTA3Ij4KICAgPHN0b3AgaWQ9InN0b3A2OTA5IiBzdG9wLWNvbG9yPSIjZGNlN2VjIiBvZmZzZXQ9IjAiLz4KICAgPHN0b3AgaWQ9InN0b3A2OTExIiBzdG9wLWNvbG9yPSIjODM5Mjk3IiBvZmZzZXQ9IjEiLz4KICA8L2xpbmVhckdyYWRpZW50PgogIDxsaW5lYXJHcmFkaWVudCBpZD0ibGluZWFyR3JhZGllbnQyNDMwIiB4MT0iNjQzLjYiIHhsaW5rOmhyZWY9IiNsaW5lYXJHcmFkaWVudDY5MDciIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIiB5MT0iMzkwLjE0IiBncmFkaWVudFRyYW5zZm9ybT0ibWF0cml4KDEuNTg0IDAgMCAuNjU4MjAgLTk0OS42OCAtMjE0Ljg3KSIgeDI9IjY0My42IiB5Mj0iNDY0Ljc0Ii8+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJsaW5lYXJHcmFkaWVudDI0MzMiIHgxPSIxMTQ3LjIiIHhsaW5rOmhyZWY9IiNsaW5lYXJHcmFkaWVudDY5MDciIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIiB5MT0iMTk4LjkiIGdyYWRpZW50VHJhbnNmb3JtPSJtYXRyaXgoLjkxMTk4IDAgMCAxLjE0MzIgLTk0OS42OCAtMjE0Ljg3KSIgeDI9IjExNDcuMiIgeTI9IjI2Mi4yMyIvPgogIDxsaW5lYXJHcmFkaWVudCBpZD0ibGluZWFyR3JhZGllbnQyNDM2IiB4MT0iMTA3Ni43IiB4bGluazpocmVmPSIjbGluZWFyR3JhZGllbnQ2OTA3IiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeTE9IjIwMi4wMiIgZ3JhZGllbnRUcmFuc2Zvcm09Im1hdHJpeCguOTExOTggMCAwIDEuMTQzMiAtOTQ5LjY4IC0yMTUpIiB4Mj0iMTA3Ni43IiB5Mj0iMjU1LjUyIi8+CiAgPHJhZGlhbEdyYWRpZW50IGlkPSJyYWRpYWxHcmFkaWVudDI0NDIiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIiBjeT0iMzE2LjkxIiBjeD0iNzkyLjgxIiBncmFkaWVudFRyYW5zZm9ybT0ibWF0cml4KDEuMjgzOSAwIDAgLjgxMjA2IC05NDkuNjggLTIxNSkiIHI9IjkxLjQ2OCI+CiAgIDxzdG9wIGlkPSJzdG9wNjk0NSIgc3RvcC1jb2xvcj0iI2ZmZiIgb2Zmc2V0PSIwIi8+CiAgIDxzdG9wIGlkPSJzdG9wNjk0NyIgc3RvcC1jb2xvcj0iIzU4NTg1OCIgb2Zmc2V0PSIxIi8+CiAgPC9yYWRpYWxHcmFkaWVudD4KIDwvZGVmcz4KIDxnIG9wYWNpdHk9IjAuMSI+CiA8cmVjdCBpZD0icmVjdDcxNDUiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0eWxlPSJjb2xvcjojMDAwMDAwIiBoZWlnaHQ9Ijc0LjYyNSIgd2lkdGg9IjExNy45OCIgc3Ryb2tlPSIjNjE2YjZkIiB5PSI1LjAzOTEiIHg9IjYuNTk2IiBzdHJva2Utd2lkdGg9IjQuMTIxNiIgZmlsbD0idXJsKCNyYWRpYWxHcmFkaWVudDI0NDIpIi8+CiA8cGF0aCBpZD0icGF0aDcxNTMiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0eWxlPSJjb2xvcjojMDAwMDAwIiBkPSJtNi41OTYgNS4xMTM1djY4Ljg2bDAuMDMxOCA1LjYxNiA1OC45NjYtMzcuMjM4LTU4LjkzNC0zNy4yMzgtMC4wNjQtMC4wMDA1eiIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjQuMTIxNiIgZmlsbD0idXJsKCNsaW5lYXJHcmFkaWVudDI0MzYpIi8+CiA8cGF0aCBpZD0icGF0aDcxNTUiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0eWxlPSJjb2xvcjojMDAwMDAwIiBkPSJtMTI0LjU4IDUuMjM3MXY2OC44NmwtMC4wMyA1LjYxNi01OC45NjgtMzcuMjM4IDU4LjkzOC0zNy4yMzggMC4wNiAwLjAwMDF6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iNC4xMjE2IiBmaWxsPSJ1cmwoI2xpbmVhckdyYWRpZW50MjQzMykiLz4KIDxwYXRoIGlkPSJwYXRoNzE1NyIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3R5bGU9ImNvbG9yOiMwMDAwMDAiIGQ9Im00OC44OCAzOS42MzVsLTQyLjI0NiA0MC4wMTQtMC4wMzIzIDAuMTI4aDExOGwtMC4wNy0wLjEyOC00Mi4yNDItNDAuMDE0Yy0xMC42ODUtMTAuMTItMjIuNDMtMTAuMzk4LTMzLjQwOCAweiIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjQuMTIxNiIgZmlsbD0idXJsKCNsaW5lYXJHcmFkaWVudDI0MzApIi8+CiA8cGF0aCBpZD0icGF0aDcxNDMiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0eWxlPSJjb2xvcjojMDAwMDAwIiBkPSJtNDguODUzIDQxLjE0NmwtNDIuMTk5LTM1Ljg4NS0wLjAzMi0wLjExNDVoMTE3Ljg3bC0wLjA3IDAuMTE0NC00Mi4xOTcgMzUuODg1Yy0xMC42NzIgOS4wNzUtMjIuNDA1IDkuMzI0LTMzLjM3IDB6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iNC4xMjE2IiBmaWxsPSIjYzZkMmQ3Ii8+CiA8L2c+CiA8bWV0YWRhdGE+CiAgPHJkZjpSREY+CiAgIDxjYzpXb3JrPgogICAgPGRjOmZvcm1hdD5pbWFnZS9zdmcreG1sPC9kYzpmb3JtYXQ+CiAgICA8ZGM6dHlwZSByZGY6cmVzb3VyY2U9Imh0dHA6Ly9wdXJsLm9yZy9kYy9kY21pdHlwZS9TdGlsbEltYWdlIi8+CiAgICA8Y2M6bGljZW5zZSByZGY6cmVzb3VyY2U9Imh0dHA6Ly9jcmVhdGl2ZWNvbW1vbnMub3JnL2xpY2Vuc2VzL3B1YmxpY2RvbWFpbi8iLz4KICAgIDxkYzpwdWJsaXNoZXI+CiAgICAgPGNjOkFnZW50IHJkZjphYm91dD0iaHR0cDovL29wZW5jbGlwYXJ0Lm9yZy8iPgogICAgICA8ZGM6dGl0bGU+T3BlbmNsaXBhcnQ8L2RjOnRpdGxlPgogICAgIDwvY2M6QWdlbnQ+CiAgICA8L2RjOnB1Ymxpc2hlcj4KICAgPC9jYzpXb3JrPgogICA8Y2M6TGljZW5zZSByZGY6YWJvdXQ9Imh0dHA6Ly9jcmVhdGl2ZWNvbW1vbnMub3JnL2xpY2Vuc2VzL3B1YmxpY2RvbWFpbi8iPgogICAgPGNjOnBlcm1pdHMgcmRmOnJlc291cmNlPSJodHRwOi8vY3JlYXRpdmVjb21tb25zLm9yZy9ucyNSZXByb2R1Y3Rpb24iLz4KICAgIDxjYzpwZXJtaXRzIHJkZjpyZXNvdXJjZT0iaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvbnMjRGlzdHJpYnV0aW9uIi8+CiAgICA8Y2M6cGVybWl0cyByZGY6cmVzb3VyY2U9Imh0dHA6Ly9jcmVhdGl2ZWNvbW1vbnMub3JnL25zI0Rlcml2YXRpdmVXb3JrcyIvPgogICA8L2NjOkxpY2Vuc2U+CiAgPC9yZGY6UkRGPgogPC9tZXRhZGF0YT4KPC9zdmc+Cg=='); ">
                EMAIL HERE AAA
            </div>
        </div>
    </xsl:template>
    
</xsl:stylesheet>