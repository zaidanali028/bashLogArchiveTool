# 📦 Log Archiver Script 🗄️

## 🌟 Overview

This bash script provides an automated solution for archiving log files, with features including:
- 🗜️ Compressing log files into a tar.gz archive
- 🕰️ Automated naming with timestamp
- 🧹 Deletion of archives older than 7 days
- 📝 Logging of archiving operations

## 🛠️ Prerequisites

- 🐚 Bash shell
- 📦 `tar` utility
- 🔒 `sudo` privileges (for file operations)

## 🚀 Usage

```bash
./log_archiver.sh /path/to/log/directory
```

### 📌 Parameters

- `$1`: Full path to the log directory you want to archive

## ✨ Features

### 🗄️ Automatic Log Archiving
- 🗜️ Compresses all files in the specified log directory
- 🏷️ Creates a timestamped archive file (e.g., `logs_archive_[20240603_123456].tar.gz`)

### 📦 Archive Management
- 📁 Creates a `.log_archives` directory in the script's location
- 🧹 Automatically deletes log archives older than 7 days
- 📝 Maintains a log of archiving operations in `archive_log.txt`

## ⚠️ Error Handling

The script includes checks for:
- 🕵️ Presence of log directory argument
- 🏠 Existence of specified log directory

## 📊 Logging

Archives are logged in `archive_log.txt` with:
- 🕰️ Timestamp
- 📍 Source log directory
- 🗂️ Archive file path

## 🔒 Security

- 🛡️ Uses `sudo` for file operations
- 🧼 Careful file deletion mechanism

## 🔧 Customization

You can modify the following variables in the script:
- 📂 `ARCHIVE_DIR`: Location of archived logs
- 🕰️ Archive retention period (currently set to 7 days)

## 💡 Example

```bash
# Archive nginx logs
./log_archiver.sh /var/log/nginx

# Archive system logs
./log_archiver.sh /var/log/syslog
```

## 🩺 Troubleshooting

- 🔓 Ensure script has execute permissions: `chmod +x log_archiver.sh`
- 🕵️ Check `archive_log.txt` for operation details
- 💾 Verify sufficient disk space before archiving

## 📜 License

- This project is licensed under the MIT License - see the [MIT](LICENSE) file for details. 📄

## 🤝 Contributing

Contributions are welcome. Please submit pull requests or open issues on the repository. 🚧


## Notes

- Tested on Ubuntu/Debian-based systems
- Requires read access to system log files
- Requires sudo priviledges for file operations


## Running the Script

### Permissions Setup
```bash
chmod +x log_archiver.sh
```

### Execution Methods
```bash
# Direct execution
./log_archiver.sh
```

### Troubleshooting
- Verify script location
- Check permissions: `ls -l log_archiver.sh`
- Confirm user privileges



---

## Acknowledgments

- Huge thanks to [roadmap.sh](https://roadmap.sh) for inspiring this server performance monitoring journey and empowering developers with clear, actionable system insights! 💡🚀 [Roadmap Project Link](https://roadmap.sh/projects/log-archive-tool)



## Support

- For support, please open an issue in the repository or contact the maintainer at zaidanali028@gmail.com.
---