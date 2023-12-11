{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "hedera-the-graph-node.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hedera-the-graph-node.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "hedera-the-graph-node.labels" -}}
helm.sh/chart: {{ .Chart.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- else -}}
app.kubernetes.io/version: {{ .Values.image.tag }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for index component
*/}}
{{- define "hedera-the-graph-node.index.selectorLabels" -}}
app: {{ printf "%s-%s" .Chart.Name "index" -}}
{{- end }}

{{/*
Selector labels for query component
*/}}
{{- define "hedera-the-graph-node.query.selectorLabels" -}}
app: {{ printf "%s-%s" .Chart.Name "query" -}}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "hedera-the-graph-node.index.serviceAccountName" -}}
{{- if .Values.index.serviceAccount.create }}
{{- default (include "hedera-the-graph-node.fullname" .) .Values.index.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.index.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "hedera-the-graph-node.query.serviceAccountName" -}}
{{- if .Values.query.serviceAccount.create }}
{{- default (include "hedera-the-graph-node.fullname" .) .Values.query.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.query.serviceAccount.name }}
{{- end }}
{{- end }}


