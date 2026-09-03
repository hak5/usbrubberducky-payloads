using AForge.Video.DirectShow;
using System;
using System.Drawing;
using System.IO;

class Program
{
    private static FilterInfoCollection GetVideoDevices()
    {
        return new FilterInfoCollection(FilterCategory.VideoInputDevice);
    }

    static void Main(string[] args)
    {

        DriveInfo[] drives = DriveInfo.GetDrives();
        string usbDriveLetter = "";

        foreach (DriveInfo drive in drives)
        {
            if (drive.IsReady && drive.VolumeLabel == "DUCKY")
            {
                usbDriveLetter = drive.Name;
                break;
            }
        }

        if (usbDriveLetter == "")
        {
            Console.WriteLine("USB drive 'DUCKY' not found.");
            return;
        }


        // Get available video devices
        var videoDevices = GetVideoDevices();

        if (videoDevices.Count == 0)
        {
            Console.WriteLine("No video devices found.");
            Environment.Exit(1); // Exit the application with an error code
        }

        // Select the first video device
        var videoDevice = videoDevices[0];

        // Create video source
        var videoSource = new VideoCaptureDevice(videoDevice.MonikerString);

        // Start capturing
        videoSource.Start();

        // Wait for a short period to ensure camera is ready (adjust as needed)
        System.Threading.Thread.Sleep(2000);

        // Capture the frame
        videoSource.NewFrame += (sender, eventArgs) =>
        {
            // Capture the new frame
            Bitmap bitmap = (Bitmap)eventArgs.Frame.Clone();

            // Save the bitmap to a file
            //
            //string filePath = @"D:\image.jpg";
            //string filePath = Path.Combine(usbDriveLetter, "\\:image.jpg");
            string filePath = usbDriveLetter + @"\image.jpg";
            bitmap.Save(filePath);

            Console.WriteLine("Image saved to " + filePath);

            // Stop capturing
            videoSource.SignalToStop();
            videoSource.WaitForStop();

            // Exit the application
            Environment.Exit(0);
        };

        // Wait for capturing to finish (This line should be removed if not waiting indefinitely)
        videoSource.WaitForStop();
    }
}
