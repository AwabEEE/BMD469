% Read the image
img = imread('brainT.jpg');
 
% Convert the image to double precision for calculations
img = double(img);
 
% Reshape the image data into a 2D matrix with each row representing a pixel
% (assuming 3 channels for RGB)
data = reshape(img, [], size(img, 3));
 
% Define the number of clusters (k)
k = 5;  % You can adjust this value based on your image

% Perform k-means clustering
[clusters, centroids] = kmeans(data, k, 'Replicate', 10);
 
% Reshape the cluster labels back into the image dimensions
%% 
segmented_img = reshape(clusters, size(img, 1), size(img, 2));
 
% Visualize the original and segmented image
figure;
subplot(1,2,1);
imshow(uint8(img));
title('Original Image');
subplot(1,2,2);
imshow(label2rgb(segmented_img));
title('Segmented Image');

% Count the number of pixels in each cluster
pixel_counts = histcounts(clusters, k);

% Display the pixel count for each cluster
disp('Pixel distribution across clusters:');
for i = 1:k
    fprintf('Cluster %d: %d pixels\n', i, pixel_counts(i));
end

figure;
bar(1:k, pixel_counts);
xlabel('Cluster Number');
ylabel('Pixel Count');
title('Pixel Distribution Across Clusters');
