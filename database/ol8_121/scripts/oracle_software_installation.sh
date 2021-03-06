. /vagrant/config/install.env

echo "******************************************************************************"
echo "Unzip software." `date`
echo "******************************************************************************"
mkdir -p ${ORACLE_HOME}
cd ${SOFTWARE_DIR}
unzip -oq "/vagrant/software/${DB_SOFTWARE}"

echo "******************************************************************************"
echo "Do software-only installation." `date`
echo "******************************************************************************"
# Fake OS.
export CV_ASSUME_DISTID=OEL7.6

${SOFTWARE_DIR}/database/runInstaller -ignoreSysPrereqs -ignorePrereq          \
    -waitforcompletion -showProgress -silent                                   \
    -responseFile $SOFTWARE_DIR/database/response/db_install.rsp               \
    oracle.install.option=INSTALL_DB_SWONLY                                    \
    ORACLE_HOSTNAME=${ORACLE_HOSTNAME}                                         \
    UNIX_GROUP_NAME=oinstall                                                   \
    INVENTORY_LOCATION=${ORA_INVENTORY}                                        \
    SELECTED_LANGUAGES=en,en_GB                                                \
    ORACLE_HOME=${ORACLE_HOME}                                                 \
    ORACLE_BASE=${ORACLE_BASE}                                                 \
    oracle.install.db.InstallEdition=EE                                        \
    oracle.install.db.DBA_GROUP=dba                                            \
    oracle.install.db.BACKUPDBA_GROUP=dba                                      \
    oracle.install.db.DGDBA_GROUP=dba                                          \
    oracle.install.db.KMDBA_GROUP=dba                                          \
    SECURITY_UPDATES_VIA_MYORACLESUPPORT=false                                 \
    DECLINE_SECURITY_UPDATES=true

