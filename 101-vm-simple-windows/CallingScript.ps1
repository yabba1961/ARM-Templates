break

# Shout out to @brwilkinson for assistance with some of this.


# Install the Azure Resource Manager modules from PowerShell Gallery
# Takes a while to install 28 modules
Install-Module AzureRM -Force -Verbose
Install-AzureRM

# Install the Azure Service Management module from PowerShell Gallery
Install-Module Azure -Force -Verbose

# Import AzureRM modules for the given version manifest in the AzureRM module
Import-AzureRM -Verbose

# Import Azure Service Management module
Import-Module Azure -Verbose

# Authenticate to your Azure account
Login-AzureRmAccount

# Adjust the 'yournamehere' part of these three strings to
# something unique for you. Leave the last two characters in each.
$URI       = 'https://raw.githubusercontent.com/yabba1961/ARM-Templates/master/101-vm-simple-windows/azuredeploy.json'
$T_URI     = 'https://raw.githubusercontent.com/yabba1961/ARM-Templates/master/101-vm-simple-windows/azuredeploy.parameters.json'
$Location  = 'west europe'
$rgname    = 'YabbasRG'
$saname    = 'yabbassa'     # Lowercase required

# Create the new resource group. Runs quickly.
New-AzureRmResourceGroup -Name $rgname -Location $Location

New-AzureRmResourceGroupDeployment -Name Simple -ResourceGroupName $rgname -TemplateFile $URI -TemplateParameterFile $T_URI
