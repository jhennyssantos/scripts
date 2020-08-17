#Criado por Jhenifer Santos em 17/08/2020

#Listar todas as reservas de DHCP independente do escopo
Get-DhcpServerv4Scope -ComputerName "hssistenserv.hhcl.com.br" | Get-DhcpServerv4Reservation -ComputerName "hssistenserv.hhcl.com.br" | Format-Table -AutoSize > C:\scripts\totaldereservas.txt

# Trata o arquivo gerado anteriormente, deixando apenas a primeira colunas, que é a coluna com os IPs
Get-Content C:\scripts\totaldereservas.txt | Foreach {"$(($_ -split '\s+',4)[0..0])"} | Format-Table -AutoSize > C:\scripts\ipsdereserva.txt

# Trata a remoção das 3 primeiras linhas sem conteudo usável para o script
$lines = Get-Content C:\scripts\ipsdereserva.txt
$first = $lines[0]
$lines | where { $_ -ne $first } | Where-Object {$_ -notmatch "IPAddress"} | Where-Object {$_ -notmatch "---------"}  | out-file C:\scripts\ipsdereservaFINAL.txt


$IPAddress = Get-Content "C:\scripts\ipsdereservaFINAL.txt"  
  
foreach ($IP in $IPAddress) {  
  
        if (test-Connection $IP -Count 2 -Quiet ) {   
          
            $status = 'True'
            Write-Host $IP is Online
  
          
                    } 
                    
                    else  
                      
                    {
                    $status = 'False'
                    Write-Host $IP is Offline
                    New-Object -TypeName psobject -Property @{
                    IP=$IP 
                    Status=$status}|select IP,Status|Export-Csv -Path $OutputPath\scripts\pingresult.txt -Append -NoTypeInformation
              
                    }
                    
 
     
         
}






