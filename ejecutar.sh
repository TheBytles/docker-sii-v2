CAMBIAR VARIABLES:#############################################################
CARPETA_EAR="proyecto-ear" # Nombre de la carpeta que contiene el EAR
NOMBRE_WAR="proyecto-war" #Aquí el nombre del WAR que se va a desplegar
###############################################################################
mvn clean package -Dskip.ejb.tests
cp ./$CARPETA_EAR/target/*.ear ./docker-sii-v2/wildfly/
#Tirar abajo todos los contenedores que se esten ejeuctando
docker-compose -f docker-compose.yml down
#Compose up construyendo una nueva imagen
docker compose -f "docker-sii-v2\docker-compose.yml" up -d --build
until $(curl --output /dev/null --silent --head --fail http://localhost:8080); do
    printf '.'
    sleep 5
done
python -mwebbrowser http://localhost:8080/$NOMBRE_WAR/
echo "Ejecución finalizada"
