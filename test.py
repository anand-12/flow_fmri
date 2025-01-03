import nibabel as nib
from matplotlib import pyplot as plt


path = '/Users/anand/Desktop/Yicun_work/SBU_PC_example/sub_01/7-T1_MPRAGE_FS.nii'
img = nib.load(path).get_fdata()

plt.style.use('default')
fig, axes = plt.subplots(4,4, figsize=(12,12))
for i, ax in enumerate(axes.reshape(-1)):
    ax.imshow(img[:,:,1 + i])
plt.show()



