import std.stdio;
import dcv.io.image : imread, imwrite;

import dcv.core;
import dcv.io.image;
import dcv.plot;
import dcv.imgproc;

import mir.ndslice;

int main(string[] args)
{
    Image img = imread("lena.png"); // read an image from filesystem.

    Slice!(ubyte*, 2) gray = img.sliced.rgb2gray;
    auto hist = calcHistogram(gray.flattened);
    auto thr = getOtsuThresholdValue(hist);
    thr.writeln;
    auto imbin = threshold!ubyte(gray, cast(ubyte)thr);

    imshow(imbin, "otsu");

    waitKey();

    return 0;
}