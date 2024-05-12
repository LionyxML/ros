Add-Type -AssemblyName System.Windows.Forms
[Windows.Forms.Sendkeys]::SendWait('{Prtsc}')
$file = $args[0]
[Windows.Forms.Clipboard]::Clear()
while ($true) {
    $img = [Windows.Forms.Clipboard]::GetImage()
    if (-not [System.Object]::ReferenceEquals($img, $null)) {
        Write-Output "Clipboard image retrieved successfully."
        $img.Save($file, [Drawing.Imaging.ImageFormat]::Png)
        Write-Output "Image saved to $file"
        break
    }
    Start-Sleep -Milliseconds 100
}
