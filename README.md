# SISCON_SmokeTest
##  Implementações no Repositório
- Para fazer qualquer implementação no repositório, criar uma nova branch e atualizar ela com o servidor remoto (*git*), baseado na *issue* que está sendo trabalhada.
- Após fazer as implementações, dar o *commit* e antes de dar *push*, realizar o rebase na master.

### Sequência git para alterações.

 ```shell
> git fetch
> git checkout [sua branch]
> git pull
> *alterações implementadas*
> git commit
> git rebase origin/master
> git push -f (--force)
```

## Dependências

Alguns pacotes são necessários para rodar todos os testes até o fim:
 - Python 3.10.2
 - Robot Framework 4.1.3
 - paramiko==2.10.3 (python)
 - clipboard==0.0.4 (python)
 - robotframework-imagehorizonlibrary==1.0
 - robotframework-pythonlibcore==3.0.0
 - robotframework-screencaplibrary==1.6.0
 - robotframework-seleniumlibrary==6.0.0
 - robotframework-SikuliLibrary==2.0.3

**Pacotes do RobotFramework podem ser instalados através do pip
 !pip install (package-name).**
