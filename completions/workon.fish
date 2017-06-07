function __fish_workon_envs
    for env_path in $WORKON_HOME/*/
        set -l env_name (basename $env_path)
        set -l env_path "$WORKON_HOME/$env_name"
        set -l activate "$env_path/bin/activate.fish"

        if not test -e $activate
            continue
        end

        echo "$env_name"
    end
end


complete -c workon --description 'List all of the environments'
complete -c workon -a "(__fish_workon_envs)" -f --description 'a virtual environment'
