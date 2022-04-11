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
