# {{ ansible_managed }}
# Env file for zookeeper startup.
# Has to be named zookeeper-env.sh to be loaded by bin/zkEnv.sh (whish is in turn called by zkServer.sh).

{% for key, value in zookeeper_env_variables.items() | sort %}
{{ key }}={{ value }}
{% endfor %}

SERVER_JVMFLAGS="-Xms{{ zookeeper_jvm_heap_size }} -Xmx{{ zookeeper_jvm_heap_size }}"
