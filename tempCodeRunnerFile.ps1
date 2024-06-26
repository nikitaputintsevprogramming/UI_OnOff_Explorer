Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Создаем новую форму
$form = New-Object System.Windows.Forms.Form
$form.FormBorderStyle = "None"

# Устанавливаем размеры формы
$form.Width = 1920
$form.Height = 100  # Высота формы

# Устанавливаем прозрачный цвет фона
$form.BackColor = [System.Drawing.Color]::Transparent

# Устанавливаем прозрачность формы
$form.TransparencyKey = $form.BackColor

# Устанавливаем положение формы
$form.StartPosition = 'Manual'
$form.Location = New-Object System.Drawing.Point(0, 1080 - $form.Height)

# Убираем рамку у окна
$form.FormBorderStyle = "None"

# Создаем панель для централизованного управления расположением кнопок
$panel = New-Object System.Windows.Forms.Panel
$panel.Width = 1920
$panel.Height = 100
$panel.Dock = [System.Windows.Forms.DockStyle]::Fill
$panel.BackColor = [System.Drawing.Color]::Transparent

# Высота кнопок
$buttonHeight = 50
$verticalCenter = ($panel.Height - $buttonHeight) / 1 

# Создаем кнопку для остановки explorer
$stopButton = New-Object System.Windows.Forms.Button
$stopButton.Text = "Start Explorer"
$stopButton.Width = 300  # Ширина кнопки
$stopButton.Height = $buttonHeight  # Высота кнопки
$stopButton.BackColor = [System.Drawing.Color]::Transparent
$stopButton.ForeColor = [System.Drawing.Color]::White
$stopButton.Location = New-Object System.Drawing.Point(210, $verticalCenter)  # Положение кнопки внутри панели (слева, по центру вертикально)
$stopButton.FlatStyle = 'Flat'  # Делаем кнопку плоской

$stopButton.Add_Click({
    # Запускаем .bat файл для остановки
    Start-Process "stop.bat"
})

# Создаем кнопку для запуска explorer
$startButton = New-Object System.Windows.Forms.Button
$startButton.Text = "Stop Explorer"
$startButton.Width = 300  # Ширина кнопки
$startButton.Height = $buttonHeight  # Высота кнопки
$startButton.BackColor = [System.Drawing.Color]::Transparent
$startButton.ForeColor = [System.Drawing.Color]::White
$startButton.Location = New-Object System.Drawing.Point(1410, $verticalCenter)  # Положение кнопки внутри панели (справа, по центру вертикально)
$startButton.FlatStyle = 'Flat'  # Делаем кнопку плоской

$startButton.Add_Click({
    # Запускаем .bat файл для запуска
    Start-Process "start.bat"
})

# Добавляем кнопки на панель
$panel.Controls.Add($stopButton)
$panel.Controls.Add($startButton)

# Добавляем панель на форму
$form.Controls.Add($panel)

# Показываем форму поверх всех окон
$form.TopMost = $true

# Запускаем форму
$form.ShowDialog()
