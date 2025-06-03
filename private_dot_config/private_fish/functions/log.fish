function log --description "Append to daily journal in Obsidian"
    # Define journal directory path
    set journal_dir "/home/lukaernestini/Insync/luka.ernestini@gmail.com/Google Drive/Obsidian/ObsidianVault/ME/Journal"
    
    # Get current date and time
    set current_date (date +%Y-%m-%d)
    set current_time (date +%H:%M:%S)
    
    # Parse options
    set -l options 'h/help' 't/time' 'w/work'
    set -l add_time 0
    set -l add_work_tag 0
    set -l log_text ""
    
    argparse $options -- $argv
    
    # Show help
    if set -q _flag_help
        echo "Usage: log [options] \"log message\""
        echo "Options:"
        echo "  -t, --time    Add timestamp prefix"
        echo "  -w, --work    Add #work tag"
        echo "  -h, --help    Show this help message"
        return 0
    end
    
    # Set flags based on options
    if set -q _flag_time
        set add_time 1
    end
    
    if set -q _flag_work
        set add_work_tag 1
    end
    
    # Get log text from remaining arguments
    set log_text (string join " " $argv)
    
    # Exit if no log text provided
    if test -z "$log_text"
        echo "Error: No log text provided."
        return 1
    end
    
    # Determine file path
    set journal_file "$journal_dir/$current_date.md"
    
    # Create directory if it doesn't exist
    if not test -d $journal_dir
        mkdir -p $journal_dir
    end
    
    # Prepare the log entry
    set log_entry ""
    
    # Add time prefix if -t flag is used
    if test $add_time -eq 1
        set log_entry "- [$current_time] "
    else
        set log_entry "- "
    end
    
    # Add the log text
    set log_entry "$log_entry$log_text"
    
    # Add work tag if -w flag is used
    if test $add_work_tag -eq 1
        set log_entry "$log_entry #work"
    end
    
    # Append to the file
    echo $log_entry >> $journal_file
    
    echo "Entry added to $journal_file"
end