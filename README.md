# Flutter Docker Template

This is a Flutter project template which able to quickly create a Flutter Web App environment through docker and develop with VSCode.

![docker-flutter](https://github.com/liuyuweitarek/flutter-docker-template/assets/54787524/eec8d154-0d2e-4c80-94b9-3448e21a7b6e)

(This image was created with the assistance of DALL·E 3)

## Getting Started

1. Install Template

    ```bash
    $ git clone https://github.com/liuyuweitarek/flutter-docker-template.git
    ```
    
    Replaced the project name with your own project name.

    1. `ctrl + shift + f` (Windows/Linux) or `cmd + shift + f` (Mac) searching for `TODO` to find the places where you need to replace the project name.

    2. Follow the formats in the TODOs.

    3. After lauch the template and did the steps above, you can customize the `Description` and change this item to `1. Install Project`.

2. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/).

3. Install VScode extension **Remote - Containers**.
    1. Go to the Extensions view by clicking on the square icon on the left sidebar or by pressing `Ctrl+Shift+X` (Windows/Linux) or `Cmd+Shift+X` (Mac).
    2. Search for **"Remote - Containers"** in the search bar.
    3. Click on the "Install" button next to the "Remote - Containers" extension.
    4. Once the extension is installed, you can follow the instructions provided in the extension's documentation to set up and use it with your project.
    
    Please note that the **"VSCode Remote - Containers"** extension allows you to develop inside a containerized environment, which can be useful for Flutter projects that require specific dependencies or configurations.

4. Install VScode extension **Flutter**. The same steps as above.

5. Create a new flutter project in `./src`.
    1. `ctrl + shift + p` (Windows/Linux) or `cmd + shift + p` (Mac) searching for `Flutter: New Project` to create a new flutter project.
    2. Select folder `./src` and build project.


6. Run the following command in your terminal:
    ```bash
    $ docker compose up --build -d
    ```
7. Follow the `Debug step` below to see whether the app is able to be running successfully or not.

## Builds

### 1. Debug

This build type is used for development and testing. It is the default build type.

1. Connect to the container through VSCode Extension.
2. Run the following command in the terminal:
    ```bash
    $ flutter run -d web-server --web-port=9001
    ```
3. Visit `http://localhost:9001` in your browser to the rendering effect. Also, you can see the logs in the terminal.

### 2. Build in Local Container
This build type is used for local production.

1. Run the following command in the terminal:
```bash
# Make sure that the services are down
$ docker compose down

# otherwise, run the following command
$ docker compose up --build -d
```

2. If it's your first time to run the app, you'll need to create a release build first.
Run the following command in the terminal(not in the container terminal):

```bash
$ flutter exec -it flutter-web-{YOUR_PROJECT_NAME} bash /usr/local/script/flutter-web-init.sh
```

Otherwise,

```bash
$ flutter exec -it flutter-web-{YOUR_PROJECT_NAME} bash /usr/local/script/flutter-web-build.sh
```

</br>

#### What's "building in local container" actually doing in the docker-compose.yaml file?

**Step 1: Create the Release Build**

To create a release build of your Flutter web app, navigate to the `src/{YOUR_PROJECT_NAME}` directory in your terminal and run the following command:

```bash
$ flutter build web
```

This command will generate the release build of your app in the ./build/web directory.

**Step 2: Mount the Build Directory to Nginx**

Next, you need to mount the ./build/web directory to the Nginx server's directory /var/www/html. To do this, you'll need to update the volumes section in your docker-compose.yaml file.

In the `docker-compose.yaml` file, locate the flutter-nginx service and update the volumes section as follows:

```yaml
volumes:
  - "./src/{YOUR_PROJECT_NAME}/build/web:/var/www/html"
```

This will mount the ./build/web directory to the /var/www/html directory inside the Nginx container.

**Step 3: Start the Nginx Server**

To start the Nginx server and make it accessible on port 80, run the following command in your terminal:

```bash
$ docker compose up --build -d
```

This will start the Nginx server and make it accessible on http://localhost:80.