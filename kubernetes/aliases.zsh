alias k=kubectl
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgns='kubectl get namespaces'
alias kgall='kubectl get ingress,service,deployment'
alias kuc='kubectl config use-context'
alias ksc='kubectl config set-context "$(kubectl config current-context)"'
alias kns='ksc --namespace'
alias kgd='kubectl get deployments'
alias kgs='kubectl get services'
alias kgj='kubectl get jobs'
alias kgi='kubectl get ingress'
alias kcc='kubectl config get-contexts'
alias kdp='kubectl describe pod'
alias kdelp='kubectl delete pod'
alias kdd='kubectl delete deployment'
alias kdj='kubectl delete job'
alias kdf='kubectl delete -f'
alias klf='kubectl logs -f'
alias kl='kubectl logs'
alias kaf='kubectl apply -f'

kexec () {
  kubectl exec -it "$1" "${2:-bash}"
}