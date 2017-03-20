Function Get-EC2InstancePassword
{
    param(
           [parameter(mandatory=$true)] [String] $PemFile
    )

    $instances = Get-ec2instance -Filter @(@{name = 'platform'; value = 'windows'})

    foreach ($i in $instances){
        $prop = @{   
            Name = $i.Name
            password = Get-EC2PasswordData -InstanceId $i.InstanceId -PemFile $PemFile
            InstanceId = $i.instances.InstanceId
        }
        New-Object -TypeName psobject -Property $prop
    }
}    
