# Installation
## Steps
- Move the files to /etc/systemd/system/

- Enable the service and start the timer.

```
systemctl enable emqtt-check-cluster.service
systemctl daemon-reload
systemctl start emqtt-check-cluster.timer
```

- List timers.

```
systemctl list-timers
```

- Check execution.

```
systemctl status emqtt-check-cluster.service
```

