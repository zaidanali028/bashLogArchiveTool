#!/bin/bash

# Function to check if the log directory argument is provided
check_log_directory() {
    # Check if the log directory argument is provided
    if [ -z "$1" ]; then
        echo "Error: Log directory not provided."
        exit 1
    fi

    # Check if the provided directory exists
    if [ ! -d "$1" ]; then
        echo "Error: Directory does not exist."
        exit 1
    fi

    echo "Log directory: $1"
    echo ""
}


# Function to get the current date and time for naming the archive file
get_current_datetime() {
    DATE=$(date +"%Y%m%d_%H%M%S")  # Get current date and time in YYYYMMDD_HHMMSS format
    echo "Current date and time: $DATE"
    echo ""

}

# Function to create the archive directory if it doesn't exist
create_archive_directory() {
    ARCHIVE_DIR="./.log_archives"  # Directory where the archives will be stored
    mkdir  -p "$ARCHIVE_DIR"  # Create the archive directory if it doesn't exist
    echo ""

}

delete_old_archived_files(){
    echo "Deleting old archived files (older than a wk)"
    ARCHIVE_DIR="./.log_archives"  # Directory where the archives will be stored

    sudo find "$ARCHIVE_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm -f {}  \;
    # -mtime +7  -> modification time greater than 7 days
    echo ""

    echo "Old Archives Deleted Successfully!"
    echo ""


}
# Function to compress the logs into a tar.gz file
compress_logs() {
    echo "Compressing logs..."
    LOG_DIR=$1  # Log directory passed as argument
    ARCHIVE_FILE="logs_archive_[${DATE}].tar.gz"  # Archive file name with date
    sudo tar -czf "$ARCHIVE_DIR/$ARCHIVE_FILE" -C "$LOG_DIR" .
    echo ""

    # -C changes the current directory to where the logs are
    # and then . means all files in the current directory

    # -c - create archive
    # -z - compress
    # -f - specify archive file name
}

# Function to log the archive operation
log_archive_operation() {
    LOG_DIR=$1
    echo "[$(date)] Archived logs from $LOG_DIR to $ARCHIVE_DIR/logs_archive_${DATE}.tar.gz" >> archive_log.txt
    echo "output of oepration stored in archive_log.txt :)"
    echo ""

}

# Function to display the result to the user
display_results() {
    echo "Log archive created: $ARCHIVE_DIR/logs_archive_${DATE}.tar.gz"
    echo "Action logged to archive_log.txt"
    echo ""

}

# Main function to run the complete process
main() {
    check_log_directory "$1"  # Check if the log directory argument is provided
    get_current_datetime  # Get the current date and time
    delete_old_archived_files
    create_archive_directory  # Create the archive directory if it doesn't exist
    compress_logs "$1"  # Compress the logs into a tar.gz file
    log_archive_operation "$1"  # Log the archive operation to the log file
    display_results  # Display the results to the user
}

# Run the main function
main "$1"