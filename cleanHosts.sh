# 1. destroy KDP kind cluster, all data will be erased
# 2. clean up /etc/hosts
export KDP_HOST=192.168.71.147

kdpHost=${KDP_HOST:-127.0.0.1}
kdpDomain="kdp-e2e.io"
kdpPrefix=("kdp-ux" "grafana" "prometheus" "alertmanager" "flink-session-cluster-kdp-data" "hdfs-namenode-0-kdp-data" "hdfs-namenode-1-kdp-data" "hue-kdp-data" "kafka-manager-kdp-data" "minio-kdp-data-api" "spark-history-server-kdp-data" "streampark-kdp-data")
etcHosts="/etc/hosts"

kind delete cluster -n kdp-e2e
for prefix in "${kdpPrefix[@]}"; do
  sudo sed -i '' "/$prefix.$kdpDomain/d" ${etcHosts}
done
