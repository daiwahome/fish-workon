# venv-workon

A python venv command wrapper which only supports activation.

## Install

With [fisherman]

```
fisher daiwahome/fish-venv-workon
```

## Usage

List all of the virtual environments.
```
workon
```

Create virtual environment (by python venv module).
```
cd $WORKON_HOME # default: $HOME/.virtualenvs
python -m venv [env_name]
```

Activate virtual environment.
```
workon [env_name]
```

Deactivate virtual environment (by python venv module).
```
deactivate
```

[fisherman]: https://github.com/fisherman/fisherman
