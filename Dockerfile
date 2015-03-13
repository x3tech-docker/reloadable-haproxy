FROM haproxy:1.5.11

ADD run.bash /run.bash

CMD ["/bin/bash", "/run.bash"]
