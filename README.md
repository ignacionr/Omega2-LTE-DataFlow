# Omega2-LTE-DataFlow

This repository contains C++ projects for the Omega2 LTE, focusing on collecting sensor data and transmitting it via LTE using the LoRaWAN network to AWS LoRaWAN Core and an AWS RDS database (MySQL).

## Features

- Collect sensor data (e.g., battery status, unit temperature, relay status, RS485 data, three-phase current, and voltage).
- Transmit data using LTE over LoRaWAN to AWS.
- Store data in AWS RDS (MySQL).
- Develop and build using a devcontainer with the OpenWRT toolchain.

## Repository Structure

- `src/`: Contains source code for the projects.
- `.devcontainer/`: Contains devcontainer configuration for setting up the development environment.
- `CMakeLists.txt`: CMake configuration file.
- `toolchain.cmake`: CMake toolchain file for cross-compiling with the OpenWRT SDK.
- `README.md`: This readme file.

## Getting Started

### Prerequisites

- Docker
- Visual Studio Code with Remote - Containers extension

### Setting Up the Development Environment

1. **Clone the repository:**

    ```sh
    git clone https://github.com/your-username/Omega2-LTE-DataFlow.git
    cd Omega2-LTE-DataFlow
    ```

2. **Open the repository in Visual Studio Code:**

    ```sh
    code .
    ```

3. **Open the folder in the devcontainer:**

    - Press `F1` and select `Remote-Containers: Reopen in Container`.

4. **Build the project:**

    ```sh
    mkdir /tmp/build
    cd /tmp/build
    cmake -G Ninja -DCMAKE_TOOLCHAIN_FILE=/workspace/toolchain.cmake /workspace
    ninja
    ./main
    ```

### Project Details

- **src/main.cpp**: A simple example that simulates reading sensor data and prints it to the console.
- **CMakeLists.txt**: Configures the project to use C++20 and defines the build process.
- **toolchain.cmake**: Configures CMake to use the OpenWRT toolchain for cross-compiling.

### Devcontainer

The `.devcontainer` folder contains the configuration for setting up the development environment using Visual Studio Code's Remote - Containers extension. The Dockerfile installs all necessary dependencies, including the OpenWRT SDK.

### Updating the Toolchain

To update the OpenWRT SDK, modify the Dockerfile and `toolchain.cmake` to point to the new SDK version.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## Contact

For any inquiries, please contact [ignacionr@gmail.com](mailto:ignacionr@gmail.com).

## Further Reading
- [Omega2 LTE Product Page](https://onion.io/store/omega2-lte-na/)
- [Video Tutorial: Introduction to Omega2 LTE](https://www.youtube.com/watch?v=6-ZrdRjqdTk)
- [OpenWRT SDK Download](https://downloads.openwrt.org/releases/23.05.2/targets/ramips/mt76x8/)
- [OpenWRT Documentation](https://openwrt.org/docs/start)
