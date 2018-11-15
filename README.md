
# EMQTT Docker Swarm Stack

## Lanzarlo en un cluster swarm

```
mkdir -p /opt/emqtt/cluster && cd /opt/emqtt/cluster
git clone https://git.enterprise.com/sistemas/project-swarm-emqtt-stack.git
docker stack deploy emqtt --compose-file=docker-compose.yml
```

### Acceder al Dashboard

```
http://IP_NODO:18083
``` 

## Parar el stack

```
docker stack rm emqtt
```

## Comandos útiles:

### Servicios

```
docker stack services emqtt
```

```
ID                  NAME                MODE                REPLICAS            IMAGE                 PORTS
80go7onpn5m1        emqtt_worker3       replicated          1/1                 emqtt-docker:latest   *:1886->1883/tcp
mhbssabejkhv        emqtt_master        replicated          1/1                 emqtt-docker:latest   *:18083->18083/tcp
p99x7j54oa64        emqtt_worker2       replicated          1/1                 emqtt-docker:latest   *:1885->1883/tcp
vt8on5ubv10w        emqtt_worker1       replicated          1/1                 emqtt-docker:latest   *:1884->1883/tcp
```

```
docker stack ls                                            
```

```
NAME                SERVICES            ORCHESTRATOR
emqtt               4                   Swarm
```

### Logs

```
docker service logs emqtt_worker1 -f
```

Igual para el resto de servicios del stack.

