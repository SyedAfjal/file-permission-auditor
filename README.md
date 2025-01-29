# **File Permission Auditor & Backup Script**  

## **Project Description**  
This project focuses on securing files in a given directory by identifying those with insecure permissions (`777`), modifying them to a secure state (`640`), and then creating a backup of the entire directory.  

---

## **Initial Directory State (Before Running the Script)**  
Note: This project was executed in a Virtual Machine (VirtualBox) running Kali Linux, ensuring a safe and controlled environment for testing file permissions and backups

<img width="303" alt="Image" src="https://github.com/user-attachments/assets/f6dadc44-830f-471c-ad75-305cf94cd3b9" />

Before running the script, the directory contains multiple files and subdirectories with different permission settings. Some files have **`-rwxrwxrwx (777)`**, meaning **any user can read, write, and execute them**.  

### **Why is This a Security Risk?**  
- **Any user can modify or execute the files**, which increases the risk of unauthorized changes.  
- **Sensitive data could be exposed or tampered with** due to overly permissive access.  
- **Attackers could exploit these permissions** to execute malicious scripts or overwrite critical files.  

---

## **How the Script Fixes This Issue**  
The Bash script performs two main tasks:  
1. **Scans for insecure files (`777` permissions) and updates them to `640`**, allowing only the file owner to read and write, while the group can only read the file. Others will have no access.  
2. **Creates a compressed backup of the entire directory**, ensuring data safety while preserving the new secure permissions.  

---

## **Script Execution Output**  

<img width="457" alt="Image" src="https://github.com/user-attachments/assets/9423901d-d48a-48d5-9a4d-563bb2b77630" />

### **What the Script Did:**  
- Scanned the directory and found **15 insecure files**.  
- Secured these files by changing their permissions from **`777` to `640`**.  
- Created a **backup file named `test_files_backup.tar.gz`** in the parent directory.  

Now, the directory is secured, and a backup has been generated for future recovery.  

---

## **Updated Directory State (After Running the Script)**  

<img width="369" alt="Image" src="https://github.com/user-attachments/assets/f170e549-e028-4114-806a-dc011275ed0f" />

After running the script, you can see that:  
- **All files now have appropriate permissions (`640`)**, making them **only readable/writable by the owner and readable by the group**.  
- The directory is **more secure**, reducing the risk of unauthorized access or modifications.  
- A **backup of the secured files is stored separately**, ensuring data is protected even if files are modified or lost.  

---

## **How to Run This Script**  
To use the script on any directory:  

1. **Make the script executable**:  
   ```bash
   chmod +x secure_and_backup.sh
   ```  
2. **Run the script with the target directory as an argument**:  
   ```bash
   ./secure_and_backup.sh /path/to/your/directory
   ```  
3. **Check the backup file in the parent directory**:  
   ```bash
   ls -l /path/to/your/directory/..
   ```

---

## **Key Takeaways from This Project**  
- **Learned how to find and modify file permissions** in Linux using `chmod`.  
- **Understood why `777` permissions are dangerous** and how `640` secures files.  
- **Practiced automating security fixes** with Bash scripting.  
- **Gained experience with creating and managing backups** using `tar`.  


