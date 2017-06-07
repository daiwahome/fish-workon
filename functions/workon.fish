if not set -q WORKON_HOME
    set -x WORKON_HOME "$HOME/.virtualenvs"
end


function __workon_list_envs -d "List all of the environments"
    for env_path in $WORKON_HOME/*/
        set -l env_name (basename $env_path)
        set -l env_path "$WORKON_HOME/$env_name"
        set -l env_bin "$env_path/bin"
        set -l activate "$env_bin/activate.fish"

        if not test -e $activate
            continue
        end

        set -l mark ' '
        set -l python_version (eval "$env_bin/python --version")

        if set -q VIRTUAL_ENV; and test $env_path = $VIRTUAL_ENV
            set -l mark '*'
        end

        printf '%s %-10s -- %s\n' $mark $env_name $python_version
    end
end


function workon -d "List or change working virtual environments"
    if not count $argv > /dev/null
        __workon_list_envs
    else
        set -l env_name $argv[1]
        set -l env_path "$WORKON_HOME/$env_name"
        set -l activate "$env_path/bin/activate.fish"

        if not test -e $activate
            echo "ERROR: Environment '$env_path' does not contain an activate script."
            return 1
        end

        source $activate
    end
end
