export fqdn="${stratoHost:-$(curl ident.me 2>/dev/null)}"
export registry="${stratoRegistry:-auth.blockapps.net:5000}/"
export repository="${stratoRepository:-blockapps}/"
export version=":${stratoVersion:-latest}"

export postgresImage="postgres"
export zookeeperImage="wurstmeister/zookeeper"

ourImages=( kafka bloc explorer nginx strato globaldb streak )

for image in ${ourImages[@]}
do eval "export ${image}Image=${registry}${repository}$image${version}"
done

