# Script to Disable HA and DRS in the Given Logical Datacenter


# Specify the Datacenter name
$datacenterName = "XXXXXX"

$datacenter = Get-Datacenter -Name $datacenterName
$clusters = Get-Cluster -Location $datacenter

if ($clusters) {
    foreach ($cluster in $clusters) {
        Write-Host "Enabling HA and DRS on cluster: $($cluster.Name)" -ForegroundColor Yellow
        # Enable HA
        Set-Cluster -Cluster $cluster -HAEnabled:$true -Confirm:$false
        # Enable DRS
        Set-Cluster -Cluster $cluster -DrsEnabled:$true -Confirm:$false

        Write-Host "HA and DRS have been Enabled on cluster: $($cluster.Name)" -ForegroundColor Green
    }
}
else {
    Write-Host "No clusters found in datacenter '$datacenterName'." -ForegroundColor Red
}
