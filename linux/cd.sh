cdls(){
    builtin cd "${1}";
    ls;
}
alias cd='cdls'
