FROM oraclelinux:8

#ENV ORACLE_HOME=/usr/lib/oracle/21/client64
#ENV LD_LIBRARY_PATH=${ORACLE_HOME}/lib:${LD_LIBRARY_PATH}
#ENV PATH=$LD_LIBRARY_PATH:$PATH
#ENV PATH=$ORACLE_HOME/bin:$PATH

ENV DOCKER_HOME=/docker
ENV DOCKER_LIBS=$DOCKER_HOME/deps

ENV ORACLE_SID=ORCLCDB
ENV ORACLE_PDB=ORCLPDB1
ENV ORACLE_DOCKER_INSTALL=true

ENV DB_PASSWORD="v&L#*GpMeNsWU&!Y"

RUN mkdir $DOCKER_HOME
RUN mkdir $DOCKER_LIBS
COPY ./deps/* $DOCKER_LIBS

RUN dnf install -y oraclelinux-developer-release-el8
RUN dnf config-manager --set-enabled ol8_developer 
RUN dnf -y install oracle-database-preinstall-23c

RUN cd $DOCKER_LIBS; yum -y localinstall *.rpm
RUN rm $DOCKER_LIBS/*


RUN dnf install -y oracle-instantclient-release-el8
RUN dnf install -y oracle-instantclient-sqlplus
RUN sqlplus -V

#RUN (echo $DB_PASSWORD; echo $DB_PASSWORD;) | /etc/init.d/oracle-free-23c configure 2>&1





