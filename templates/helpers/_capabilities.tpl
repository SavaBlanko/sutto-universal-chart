{{- define "helpers.capabilities.helmVersion" -}}
{{- $version := "v3" -}}
{{- if typeIs "string" .Capabilities.KubeVersion -}}
  {{- $version = "v2" -}}
{{- end -}}
{{- with .Values.global -}}
  {{- with .helmVersion -}}
    {{- $version = . -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.kubeVersion" -}}
{{- $version := .Capabilities.KubeVersion.Version -}}
{{- with .Values.kubeVersion -}}
  {{- $version = . -}}
{{- end -}}
{{- with .Values.global -}}
  {{- with .kubeVersion -}}
    {{- $version = . -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.cronJob.apiVersion" -}}
{{- $version := "batch/v1" -}}
{{- if semverCompare "<1.21-0" (include "helpers.capabilities.kubeVersion" .) -}}
  {{- $version = "batch/v1beta1" -}}
{{- end -}}
{{- with .Values.global -}}
  {{- with .resourceApiVersions -}}
    {{- with .cronJob -}}
      {{- $version = . -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.deployment.apiVersion" -}}
{{- $version := "apps/v1" -}}
{{- if semverCompare "<1.14-0" (include "helpers.capabilities.kubeVersion" .) -}}
  {{- $version = "extensions/v1beta1" -}}
{{- end -}}
{{- with .Values.global -}}
  {{- with .resourceApiVersions -}}
    {{- with .deployment -}}
      {{- $version = . -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.statefulSet.apiVersion" -}}
{{- $version := "apps/v1" -}}
{{- if semverCompare "<1.14-0" (include "helpers.capabilities.kubeVersion" .) -}}
  {{- $version = "apps/v1beta1" -}}
{{- end -}}
{{- with .Values.global -}}
  {{- with .resourceApiVersions -}}
    {{- with .statefulSet -}}
      {{- $version = . -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.ingress.apiVersion" -}}
{{- $version := "networking.k8s.io/v1" -}}
{{- $kubeVersion := include "helpers.capabilities.kubeVersion" . -}}
{{- if semverCompare "<1.14-0" $kubeVersion -}}
  {{- $version = "extensions/v1beta1" -}}
{{- else if semverCompare "<1.19-0" $kubeVersion -}}
  {{- $version = "networking.k8s.io/v1beta1" -}}
{{- end -}}
{{- with .Values.global -}}
  {{- with .resourceApiVersions -}}
    {{- with .ingress -}}
      {{- $version = . -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.pdb.apiVersion" -}}
{{- $version := "policy/v1" -}}
{{- if semverCompare "<1.21-0" (include "helpers.capabilities.kubeVersion" .) -}}
  {{- $version = "policy/v1beta1" -}}
{{- end -}}
{{- with .Values.global -}}
  {{- with .resourceApiVersions -}}
    {{- with .pdb -}}
      {{- $version = . -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.traefik.apiVersion" -}}
{{- $version := "" -}}
{{- if .Capabilities.APIVersions.Has "traefik.io/v1alpha1" -}}
  {{- $version = "traefik.io/v1alpha1" -}}
{{- else if .Capabilities.APIVersions.Has "traefik.containo.us/v1alpha1" -}}
  {{- $version = "traefik.containo.us/v1alpha1" -}}
{{- end -}}
{{- with .Values.global -}}
  {{- with .resourceApiVersions -}}
    {{- with .traefik -}}
      {{- $version = . -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.istiogateway.apiVersion" -}}
{{- $version := "networking.istio.io/v1" -}}
{{- with .Values.global -}}
  {{- with .resourceApiVersions -}}
    {{- with .istioGateway -}}
      {{- $version = . -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.istiovirtualservice.apiVersion" -}}
{{- $version := "networking.istio.io/v1" -}}
{{- with .Values.global -}}
  {{- with .resourceApiVersions -}}
    {{- with .istioVirtualService -}}
      {{- $version = . -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.istiodestinationrule.apiVersion" -}}
{{- $version := "networking.istio.io/v1" -}}
{{- with .Values.global -}}
  {{- with .resourceApiVersions -}}
    {{- with .istioDestinationRule -}}
      {{- $version = . -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.istiopeerauthentication.apiVersion" -}}
{{- $version := "security.istio.io/v1" -}}
{{- with .Values.global -}}
  {{- with .resourceApiVersions -}}
    {{- with .istioPeerAuthentication -}}
      {{- $version = . -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}


{{- define "helpers.capabilities.istioauthorizationpolicy.apiVersion" -}}
{{- $version := "security.istio.io/v1" -}}
{{- with .Values.global -}}
  {{- with .resourceApiVersions -}}
    {{- with .istioAuthorizationPolicy -}}
      {{- $version = . -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $version -}}
{{- end -}}