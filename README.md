<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="https://upload.wikimedia.org/wikipedia/commons/4/46/Oracle_linux_logo.svg" alt="Logo" height="200">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Docker_%28container_engine%29_logo.svg/1920px-Docker_%28container_engine%29_logo.svg.png" alt="Logo" height="200">
  </a>

  <h3 align="center">Oracle Linux Docker</h3>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

The main prequisite is docker and docker compose.
* Docker
  <br />
  Install Guide: <a>https://docs.docker.com/engine/install/</a>
* Docker Desktop (Optional, but highly recommended)
  <br />
  Windows: <a>https://docs.docker.com/desktop/install/windows-install/</a>
  <br />
  Linux: <a>https://docs.docker.com/desktop/install/linux-install/</a>
* Make (Optional, but recommended for use Makefile commands without copy them)
### Installation

_Below is an example of how to create Oracle Linux container and how to configure Oracle Database FREE._

1. Clone the repo
   ```sh
   git clone https://github.com/root-hunter/oracle-docker.git
   ```
2. Download dependencies, build image and initialize container
   ```sh
   make build-all
   ```
3. Enter in the container shell with docker exec command or with Exec menu in Docker Desktop, run following command (Initialize Oracle Database FREE)
   ```sh
   /etc/init.d/oracle-free-23c configure
   ```
4a.a. Log into database (Shell - Pluggable Database (PDB))
   ```sh
sqlplus sys@localhost:1521/FREEPDB1 as sysdba
   ```
4a.b. Log into database (Shell - Container Database (CDB))
   ```sh
sqlplus sys@localhost:1521/FREE as sysdba
   ```
4b. Log into database (Java)
   ```java
OracleDataSource ods = new OracleDataSource();
ods.setURL("jdbc:oracle:thin:@localhost:1521/FREEPDB1"); // jdbc:oracle:thin@[hostname]:[port]/[DB service name]
ods.setUser("[Username]");
ods.setPassword("[Password]");
Connection conn = ods.getConnection();
 
PreparedStatement stmt = conn.prepareStatement("SELECT 'Hello World!' FROM dual");
ResultSet rslt = stmt.executeQuery();
while (rslt.next()) {
  System.out.println(rslt.getString(1));
}
   ```
4c. Log into database (Python)
   ```python
import oracledb

conn = oracledb.connect(user="[Username]", password="[Password]", dsn="localhost:1521/FREEPDB1")
with conn.cursor() as cur:
   cur.execute("SELECT 'Hello World!' FROM dual")
   res = cur.fetchall()
   print(res)
   ```
4x. For more log snippet visit: <a>https://www.oracle.com/in/database/free/get-started/</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/root-hunter/oracle-docker/blob/main/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://it.linkedin.com/in/antonio-ricciardi-279118210
