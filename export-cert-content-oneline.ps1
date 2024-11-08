$certificateContent = Get-Content -Path "C:\Users\student\Desktop\p2scert.cer"; `
$insideCertificate = $false; `
$certificateBody = ""; `
foreach ($line in $certificateContent) { `
    if ($line -eq "-----BEGIN CERTIFICATE-----") { `
        $insideCertificate = $true `
    } elseif ($line -eq "-----END CERTIFICATE-----") { `
        $insideCertificate = $false `
    } elseif ($insideCertificate -and $line.Trim() -ne "") { `
        $certificateBody += $line.Trim() `
    } `
}; `
Set-Content -Path "C:\Users\student\Desktop\singleLineCertBody.txt" -Value $certificateBody -Force
