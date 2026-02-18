```
git clone git@github.com:alextongdo/slime.git
cd slime/docker
bash ./launch_docker.sh
```
This puts you inside a docker container with all of slime's depedencies pre-installed.
Within the container, run
```
cd docker
bash ./extra_setup_in_docker.sh
cd ..
```
Now your installation of slime is synced up with the code in your local repo.
You can make changes to the source code and they should be reflected when you run slime within the container.

To run an example experiment,
```
python tests/test_qwen2.5_0.5B_gsm8k_short.py
```

> Note this setup can be replicated with NemoRL, and given that they have an example with a single GPU...
