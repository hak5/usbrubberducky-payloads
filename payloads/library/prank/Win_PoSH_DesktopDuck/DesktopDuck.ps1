[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms");
Add-Type -Assembly PresentationFramework
# xml of the wpf xaml code. this is the window to be shown
[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Width="320"
    Height="240"
    WindowStyle="None" 
    AllowsTransparency="True" 
    Background="Transparent" 
    Topmost="True" 
    ShowInTaskbar="False" 
    ResizeMode="NoResize">
    <Grid>
        <Viewbox x:Name="DuckViewbox" xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Stretch="Uniform">
          <Canvas Name="Layer_1" Width="640" Height="480" Canvas.Left="0" Canvas.Top="0"  RenderTransformOrigin="0.5,0.5">
            <Canvas.RenderTransform>
                <TransformGroup>
                    <ScaleTransform x:Name="DuckyScale" ScaleX="-1"/>
                </TransformGroup>
            </Canvas.RenderTransform>
            <Canvas.Resources/>
            <!--Unknown tag: metadata-->
            <!--Unknown tag: sodipodi:namedview-->
            <Path xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" Name="path2" Fill="#FFF15A24" StrokeThickness="5" Stroke="#FF000000" StrokeMiterLimit="10">
              <Path.Data>
                <PathGeometry Figures="m 236.71 379.105 c 0 0 15.237 39.537 12.767 58.895 -12.767 -1.854 -32.535 -6.796 -32.535 -6.796 0 0 -9.678 -1.44 -11.738 0.824 -2.06 2.264 -22.239 2.678 -23.475 4.942 -1.235 2.265 -2.266 5.765 -2.06 8.442 0.207 2.677 -8.648 9.265 -7.619 10.913 1.029 1.648 0 2.06 9.678 2.678 9.678 0.617 80.929 1.441 84.84 0 3.912 -1.442 2.677 -12.149 2.471 -14.827 -0.207 -2.677 -18.122 -62.394 -21.623 -65.071 -3.501 -2.677 -4.943 -4.53 -6.59 -4.324 -1.647 0.206 -4.116 4.324 -4.116 4.324 z" FillRule="NonZero"/>
              </Path.Data>
				<Path.Triggers>
					<EventTrigger RoutedEvent="Window.Loaded">
						<BeginStoryboard>
							<Storyboard>
								<DoubleAnimation From="0" To="35" Duration="00:00:01"
							Storyboard.TargetName="path2"
							Storyboard.TargetProperty="(Canvas.Left)"
							AutoReverse="True" RepeatBehavior="Forever"/>
							</Storyboard>
						</BeginStoryboard>
					</EventTrigger>
				</Path.Triggers>
            </Path>
            <Path xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" Name="path4" Fill="#FFF15A24" StrokeThickness="5" Stroke="#FF000000" StrokeMiterLimit="10">
              <Path.Data>
                <PathGeometry Figures="m 295.125 387.11 c 0.57 2.084 4.012 3.529 5.322 5.415 1.521 2.189 3.158 4.339 4.6 6.573 2.977 4.61 5.327 9.352 8.11 13.996 3.083 5.144 6.027 10.228 7.747 15.981 0.76 2.54 3.21 6.122 1.555 8.715 -1.529 2.396 -6.157 2.751 -8.732 2.85 -13.666 0.529 -27.399 2.356 -41.175 1.653 -3.563 -0.182 -7.601 -0.675 -11.114 0.046 -2.211 0.454 -7.535 0.332 -8.68 2.641 -1.548 3.125 2.679 4.707 3.261 7.439 0.532 2.495 -1.232 7.147 0.495 9.049 1.76 1.938 7.09 1.217 9.472 1.688 3.12 0.619 6.549 0.665 8.939 2.644 5.092 4.212 9.153 7.027 15.656 7.703 6.848 0.71 13.464 -0.589 20.046 -1.654 2.795 -0.453 5.258 -1.797 8.061 -2.492 3.057 -0.759 5.883 -1.205 8.687 -2.457 4.99 -2.23 10.663 -5.058 15.247 -8.526 4.371 -3.306 9.693 -7.151 8.938 -13.61 -0.595 -5.099 -5.257 -9.845 -8.07 -13.836 -1.54 -2.185 -2.372 -4.854 -3.876 -7.275 -1.546 -2.487 -3.848 -4.371 -5.372 -6.997 -3.106 -5.339 -6.187 -10.626 -10.127 -15.536 -1.645 -2.047 -3.355 -4.463 -5.271 -6.304 -1.238 -1.188 -2.564 -2.273 -3.513 -3.58 -0.748 -1.033 -1.278 -2.461 -2.263 -3.447 -2.027 -2.022 -4.501 -3.383 -6.568 -5.265 -2.117 -1.926 -4.144 -3.803 -6.452 -5.534 -2.18 -1.636 -6.334 -2.913 -9.215 -1.808 -2.962 1.136 -3.74 5.54 -3.14 8.405 0.606 2.904 3.602 3.971 6.401 3.938" FillRule="NonZero"/>
              </Path.Data>
				<Path.Triggers>
					<EventTrigger RoutedEvent="Window.Loaded">
						<BeginStoryboard>
							<Storyboard>
								<DoubleAnimation From="0" To="-35" Duration="00:00:01"
							Storyboard.TargetName="path4"
							Storyboard.TargetProperty="(Canvas.Left)"
							AutoReverse="True" RepeatBehavior="Forever"/>
							</Storyboard>
						</BeginStoryboard>
					</EventTrigger>
				</Path.Triggers>
            </Path>
            <Path xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" Name="path6" Fill="#FFFBB03B" StrokeThickness="5" Stroke="#FF000000" StrokeMiterLimit="10">
              <Path.Data>
                <PathGeometry Figures="m 547 213 c -5 195.449 -202 195.449 -315.54 195.449 -70.991 0 -128.54 -57.55 -128.54 -128.54 0 -70.991 57.549 -128.54 128.54 -128.54 C 302.451 151.369 381 262 547 213 Z" FillRule="NonZero"/>
              </Path.Data>
            </Path>
            <Ellipse xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" Canvas.Left="124.3" Canvas.Top="31.5" Width="165" Height="165" Name="circle8" Fill="#FFFBB03B" StrokeThickness="5" Stroke="#FF000000" StrokeMiterLimit="10"/>
            <Path xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" Name="path10" Fill="#FFF15A24" StrokeThickness="5" Stroke="#FF000000" StrokeMiterLimit="10">
              <Path.Data>
                <PathGeometry Figures="m 60.697 124.416 c 7.819 39.094 44.355 36.277 68.726 36.277 15.656 0 28.347 -12.692 28.347 -28.347 0 -15.656 -12.69 -28.347 -28.347 -28.347 -14.871 0 -30.469 22.551 -64.097 15.042 -2.398 0.001 -4.629 2.344 -4.629 5.375 z" FillRule="NonZero"/>
              </Path.Data>
            </Path>
            <Ellipse xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" Canvas.Left="158.8" Canvas.Top="68" Width="40" Height="40" Name="circle12" Fill="#FFFFFFFF" StrokeThickness="5" Stroke="#FF000000" StrokeMiterLimit="10"/>
            <Ellipse xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" Canvas.Left="171.3" Canvas.Top="80.5" Width="15" Height="15" Name="circle14" Fill="#000000" StrokeThickness="5" Stroke="#FF000000" StrokeMiterLimit="10"/>
          </Canvas>
        </Viewbox>
    </Grid>
</Window>
"@
# the direction the duck is traveling in
$goingRight = $true;
# get the screen
$Screen = [System.Windows.Forms.Screen]::PrimaryScreen;
# create a reader for the xml
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
# create the window from the reader
$window = [Windows.Markup.XamlReader]::Load($reader)
# find the ScaleTransform for the Canvas on the window
# this is used for fliping the image
$duck = $window.FindName("DuckyScale")
# add right click to window to close it
$handler = [Windows.Input.MouseButtonEventHandler]{ 
    $Timer.Stop();
    $window.Close(); 
    $_.Handled = $true; }
$window.Add_MouseRightButtonDown($handler);
# get task bar height
# Note: this is expecting is to be top or bottom
$taskbar = ($Screen.Bounds.Height - $Screen.WorkingArea.Height);
# set the window postion
$window.Left = $Screen.WorkingArea.Left;
$window.Top = $Screen.Bounds.Height - $window.Height;
if ($Screen.WorkingArea.Top -eq 0)
{
    $window.Top = $window.Top - $taskbar;
}
# timer that is used to move the window
$Timer = New-Object System.Windows.Forms.Timer;
$Timer.Interval = 200;
$Timer.add_Tick(
    {
        if($goingRight)
        {
			# check to see if we are going of the edge
            if(($window.Left + 5) -lt ($Screen.WorkingArea.Width - $window.Width))
            {
                $window.Left = ($window.Left + 5)
            }
            else
            {
				# flip image
                $duck.ScaleX = 1;
				#change direction
                $script:goingRight = !$goingRight;
            }
        }else
        {
			# check to see if we are going of the edge
            if(($window.Left - 5) -gt 0)
            {
                $window.Left = ($window.Left - 5)
            }
            else
            {
                $duck.ScaleX = -1;
                $script:goingRight = !$goingRight;
            }
        }
    }
); 
$Timer.Start();

$window.ShowDialog()
$Timer.Dispose()