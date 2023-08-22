## Phase Unwrapping for Phase Imaging using Plug-and-Play Proximal Algorithm

Welcome to the GitHub repository for the implementation of the research work titled "Phase Unwrapping for Phase Imaging using Plug-and-Play Proximal Algorithm." This repository houses the code and resources to replicate the robust iterative method proposed in the paper. The method aims to address the challenges posed by phase unwrapping in the presence of noise, inadequate sampling, measurement errors, and equipment calibration issues.

### Abstract

Phase Unwrapping (PU) is a critical process in various scientific optical applications, where the goal is to determine continuous phase values from discretely acquired data within the interval of (−π, π]. However, inherent difficulties such as insufficient sampling, measurement errors, and calibration inconsistencies can lead to excessive noise and unexpected phase discontinuities in the unwrapped phase. 

This repository showcases a novel and robust approach based on the Plug-and-Play (PnP) proximal algorithm for unwrapping two-dimensional phase values while simultaneously mitigating noise at each iteration. The method leverages a least-squares formulation centered around local phase differences and reformulates the problem as a partially differentiable equation. Notably, a closed-form solution for one of the subproblems within the PnP framework is obtained by utilizing the fast cosine transform.

<p align="center">
  <img src="https://github.com/andr1729/pnp-pu/assets/86633420/cabad032-382a-4a83-99e8-f349566ede00" alt="Method Illustration">
</p>


### Key Features

- **Robust Iterative Method**: Our approach provides a reliable solution for phase unwrapping in challenging scenarios characterized by high levels of noise and unexpected discontinuities.
- **Plug-and-Play Proximal Algorithm**: By harnessing the power of the PnP algorithm, we achieve enhanced convergence and accuracy, while also addressing noise reduction concurrently.
- **Closed-form Solutions**: The utilization of fast cosine transform enables efficient closed-form solutions for subproblems, contributing to quicker and more stable phase reconstruction.
- **Code Implementation**: This repository contains the complete code implementation of the proposed method, accompanied by documentation and examples to facilitate easy adoption and experimentation.
- **High Noise Scenarios**: Our method demonstrates its effectiveness even in scenarios with extremely high noise levels, showcasing its robustness and reliability.

### Usage:


- Run the `unwrapp.m` script in the `PnP ADMM` folder. This script performs phase unwrapping process.

- Note: `PeaksCreation` folder contains a function to generate synthetic wrapped peaks images with desired signal to noise ratios, which is useful for testing the algorithm.

   
### Citing

If you find this method useful in your research or applications, please consider citing our original paper:

*Cita cuando salga*

We're excited to share this method with the community and look forward to your contributions and feedback. Happy coding!

*Jhon Ramirez - jhon2180076@correo.uis.edu.co*

---

*Disclaimer: "This repository is provided for educational and research purposes. The code and method are based on the research paper mentioned above. Please refer to the paper for a complete understanding of the method's details and theoretical foundations."*
