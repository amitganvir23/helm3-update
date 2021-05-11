{{/*
COMMENT: Custome entry added to using variable "name" from template chart.yml "{{ template "name" . }}"
*/}}

{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "application.yml" -}}
{{- $application := .Files.Get "spring-config/application.yml" -}}
{{- $application := $application | replace "%mongodb.host%" .Values.mongodb.host -}}
{{- $application := $application | replace "%mongodb.port%" .Values.mongodb.port -}}
{{- $application := $application | replace "%mongodb.database%" .Values.mongodb.database -}}
{{- $application := $application | replace "%mongodb.username%" .Values.mongodb.username -}}
{{- $application := $application | replace "%mongodb.password%" .Values.mongodb.password -}}
{{- toYaml $application | indent 2 -}}
{{- end -}}
