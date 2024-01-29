FROM rabbitmq

RUN rabbitmq-plugins enable --offline rabbitmq_management rabbitmq_mqtt

# Set up environment variables
ENV RABBITMQ_DEFAULT_USER=admin
ENV RABBITMQ_DEFAULT_PASS=admin_password

# Create the celery user
RUN rabbitmqctl add_user celery celery

# Set permissions for the default user
RUN rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
# Set permissions for additional users
RUN rabbitmqctl set_permissions -p / celery ".*" ".*" ".*"

# Create additional virtual hosts
RUN rabbitmqctl add_vhost celery

# Set permissions for the default user on additional virtual hosts
RUN rabbitmqctl set_permissions -p celery celery ".*" ".*" ".*"
RUN rabbitmqctl set_permissions -p celery admin ".*" ".*" ".*"

# Expose RabbitMQ ports
EXPOSE 5672 15672 1883 15675 15671 8883

# CMD ["rabbitmq-server"] # Uncomment this line if you want to start RabbitMQ in the foreground
