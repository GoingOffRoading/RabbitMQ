FROM rabbitmq

LABEL org.opencontainers.image.source = "= https://github.com/GoingOffRoading/rabbitmq"

RUN rabbitmq-plugins enable --offline rabbitmq_management rabbitmq_mqtt 

EXPOSE 15671 15672 1883 8883