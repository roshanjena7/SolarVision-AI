clc;
clear;
close all;

load('models\SolarVision_FinalModel.mat');

[file, path] = uigetfile( ...
    {'*.jpg;*.jpeg;*.png;*.bmp', 'Solar Panel Images'}, ...
    'Select a Solar Panel Thermal Image');

if isequal(file,0)
    disp('No image selected.');
    return;
end

img = imread(fullfile(path,file));

img = imresize(img,[224 224]);

if size(img,3) == 1
    img = repmat(img,[1 1 3]);
elseif size(img,3) == 4
    img = img(:,:,1:3);
end

[predictedClass, scores] = classify(netOversampled,img);

confidence = max(scores) * 100;

figure;
imshow(imread(fullfile(path,file)));

title(sprintf('Predicted Class: %s | Confidence: %.2f%%', ...
    string(predictedClass), confidence));

fprintf('\nSolarVision AI Prediction\n');
fprintf('Image: %s\n', file);
fprintf('Predicted Class: %s\n', string(predictedClass));
fprintf('Confidence: %.2f%%\n', confidence);