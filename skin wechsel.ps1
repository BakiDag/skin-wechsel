#Assembly
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing.ColorTranslator.FromHtml")
######################################################################################
$string = [ordered]@{Height=300;Width=500; X=20;Y=200; LabelBackColor="Red"; LabelForeColor="Yellow";}
$string | ConvertTo-Json > jsonconfig.json

$Json = (Get-Content -Raw -Encoding UTF8 jsonconfig.json) | ConvertFrom-Json

######################################################################################
#$xmlConfig = New-Object System.Xml.XmlTextWriter(".\StockConfig.xml", [System.Text.Encoding]::UTF8 )
$xfile = ".\StockConfig.xml"
    #Anlegen eines XML Objektes (leer)
    $xobj = New-Object XML
    # Laden des XML Dokumentes in das XML Objekt
    
 
    #XMLClose
    $xobj.Load($xfile)          
    Write-Host("Stock Height: "+$xobj.Property.Size.Height)
    Write-Host("Stock Width: "+ $xobj.Property.Size.Width )
    Write-Host("Stock X: "+$xobj.Property.Location.X)
    Write-Host("Stock Y: "+$xobj.Property.Location.Y)
    Write-Host("Stock LColor: "+ $xobj.Property.LabelColor.BackColor.Color)
    Write-Host("Stock LForeColor: "+ $xobj.Property.LabelColor.ForeColor.Color)
    Write-Host("Stock GroupBoxFColor: "+ $xobj.Property.GroupBox.ForeColor.Color)
####################################################################################
 $xfile2 = ".\ModConfig.xml"
    #Anlegen eines XML Objektes (leer)
    $xobj2 = New-Object XML
    # Laden des XML Dokumentes in das XML Objekt
    # Kann nicht geladen werden wegen xml writer process
 
    #XMLClose
    $xobj2.Load($xfile2)          
    Write-Host("Modified Height: "+$xobj2.Property.Size.Height)
    Write-Host("Modified Width: "+ $xobj2.Property.Size.Width )
    Write-Host("Modified X: "+$xobj2.Property.Location.X)
    Write-Host("Modified Y: "+$xobj2.Property.Location.Y)
    Write-Host("modified LColor: "+ $xobj2.Property.LabelColor.BackColor.Color)
    Write-Host("modified LForeColor: "+ $xobj2.Property.LabelColor.ForeColor.Color)
    Write-Host("modified GroupBoxFColor: "+ $xobj2.Property.GroupBox.ForeColor.Color)
    #####################################################################################
    # GroupBox1
    
    $groupBox1 = New-Object System.Windows.Forms.GroupBox
    $groupBox1.Location = '20,20' 
    $groupBox1.size = '200,55'
    $groupBox1.text = "Size Values"
    $groupBox1.Visible = $true
        
    #####################################################

    # GroupBox1
    
    $groupBox2 = New-Object System.Windows.Forms.GroupBox
    $groupBox2.Location = '250,20' 
    $groupBox2.size = '200,55'
    $groupBox2.text = "Location Values"
    $groupBox2.Visible = $true
    ######################################################
    # GroupBox1
    
    $groupBox3 = New-Object System.Windows.Forms.GroupBox
    $groupBox3.Location = '20,80' 
    $groupBox3.size = '200,90'
    $groupBox3.text = "Change Color/Theme"
    $groupBox3.Visible = $true
    ######################################################

  $windowButton = New-Object System.Windows.Forms.Button
  $windowButton.Location = New-Object System.Drawing.Size(30,100)
  $windowButton.Size = New-Object System.Drawing.Size(80,30)
  $windowButton.Text = "StockConfig"
  $windowButton.Add_Click({ 
  
  $window.BackColor = ""
  $groupBox1.ForeColor =""
  $groupBox2.ForeColor=""
  $groupBox3.ForeColor=""
  $label.ForeColor = ""
  $label2.ForeColor =""
  $label.BackColor = ""
  $label2.BackColor = ""
  $label3.ForeColor = ""
  $label4.ForeColor =""
  $label3.BackColor = ""
  $label4.BackColor = ""
  $windowButton.ForeColor = ""
  $windowButton2.ForeColor = ""
  $windowButton3.ForeColor = ""

  $windowButton.BackColor = ""
  $windowButton2.BackColor = ""    
  $windowButton3.BackColor = ""
  $window.Location = New-Object System.Drawing.Point(200,200) 

  })
#####################################################
  
  $windowButton2 = New-Object System.Windows.Forms.Button
  $windowButton2.Location = New-Object System.Drawing.Size(120,100)
  $windowButton2.Size = New-Object System.Drawing.Size(80,30)
  $windowButton2.Text = "CustomXML"
  
  
  $windowButton2.Add_Click({

  $window.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#161616")

  $groupBox1.ForeColor =$xobj2.Property.LabelColor.ForeColor.Color
  $groupBox2.ForeColor=$xobj2.Property.LabelColor.ForeColor.Color
  $groupBox3.ForeColor=$xobj2.Property.LabelColor.ForeColor.Color

  $label.ForeColor = $xobj2.Property.LabelColor.ForeColor.Color
  $label2.ForeColor =$xobj2.Property.LabelColor.ForeColor.Color
  $label3.ForeColor =$xobj2.Property.LabelColor.ForeColor.Color
  $label4.ForeColor =$xobj2.Property.LabelColor.ForeColor.Color

  $label.BackColor = "ControlDark"
  $label2.BackColor = "ControlDark"
  $label3.BackColor = "ControlDark"
  $label4.BackColor = "ControlDark"

  $windowButton.ForeColor = $xobj2.Property.LabelColor.ForeColor.Color
  $windowButton2.ForeColor = $xobj2.Property.LabelColor.ForeColor.Color
  $windowButton3.ForeColor = $xobj2.Property.LabelColor.ForeColor.Color

  $windowButton.BackColor = "ControlDark"
  $windowButton2.BackColor = "ControlDark"
  $windowButton3.BackColor = "ControlDark"
  $window.Location =  New-Object System.Drawing.Point($xobj2.Property.Location.X, $xobj2.Property.Location.Y)    
     
  })

#####################################################

  $windowButton3 = New-Object System.Windows.Forms.Button
  $windowButton3.Location = New-Object System.Drawing.Size(120,130)
  $windowButton3.Size = New-Object System.Drawing.Size(80,30)
  $windowButton3.Text = "CustomJson"
  
  
  $windowButton3.Add_Click({
  $window.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#003d33")

  $groupBox1.ForeColor ="white"
  $groupBox2.ForeColor="white"
  $groupBox3.ForeColor="white"

  $label.ForeColor = "white"
  $label2.ForeColor = "white"
  $label3.ForeColor = "white"
  $label4.ForeColor = "white"

  $label.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#439889")
  $label2.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#439889")
  $label3.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#439889")
  $label4.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#439889")

  $windowButton.ForeColor = $xobj2.Property.LabelColor.ForeColor.Color
  $windowButton2.ForeColor = $xobj2.Property.LabelColor.ForeColor.Color

  

  $windowButton.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#00695c")
  $windowButton2.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#00695c")
  $windowButton3.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#00695c")

  $window.Location =  New-Object System.Drawing.Point($Json.X, $Json.Y)  

     
     
  })
#####################################################
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(30,40)
$label.Size = New-Object System.Drawing.Size(80,20)
$label.Text = 'Breite ' + $window.width 
#####################################################
$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(120,40)
$label2.Size = New-Object System.Drawing.Size(80,20)
$label2.Text = 'Höhe ' +$window.height 
#####################################################
$label3 = New-Object System.Windows.Forms.Label
$label3.Location = New-Object System.Drawing.Point(270,40)
$label3.Size = New-Object System.Drawing.Size(60,20)
$label3.Text = 'X ' +$window.Location.X 
#####################################################
$label4 = New-Object System.Windows.Forms.Label
$label4.Location = New-Object System.Drawing.Point(350,40)
$label4.Size = New-Object System.Drawing.Size(60,20)
$label4.Text = 'Y ' +$window.Location.Y 
#####################################################
$window = New-Object System.Windows.Forms.Form
$window.Width = $xobj.Property.Size.Width
$window.Height = $xobj.Property.Size.Height
$window.StartPosition = 'Manual'

####################################
$window.Add_Resize({ 
    if ($window.Size -ne [System.Drawing.Size]::1,1){
        #[System.Windows.Forms.MessageBox]::Show("Form wurde veraendert!")
        $label.Text = 'Breite ' +$window.width 
        $label2.Text = 'Hoehe ' +$window.height             
    }
})
#########################################################
$window.Add_LocationChanged({
    if ($window.Location.X -ne 1 )
    {        
        $label3.Text = 'X ' +$this.Location.X     
    }
    
    if($window.Location.Y -ne 1)
    {
        $label4.Text ='Y ' +$this.Location.Y
    }

    })
################################################################
    $window.MinimumSize = New-Object System.Drawing.Size(490,220)




$window.Controls.Add($windowButton)
$window.Controls.Add($windowButton2)
$window.Controls.Add($windowButton3)
$window.Controls.Add($label4)
$window.Controls.Add($label3)
$window.Controls.Add($label2)
$window.Controls.Add($label)
$window.Controls.Add($groupBox1)
$window.Controls.Add($groupBox2)
$window.Controls.Add($groupBox3)
[void]$window.ShowDialog()