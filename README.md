# README

1. Implement endpoint that will get csv file in base64 and process it.

File structure:
| Unique | number | Principal | Annual rate |
| :---: | :---: | :---: | :---: |
| L13052021/0006 | 200 000 | 12% |
| L13052021/0007 | 300 000 | 56% |
| L13052021/0008 | 400 000 | 83% |

2. Only csv file can be accepted.

3. File should be parsed after receiving.

4. Following data should be saved in DB in Loans table from file after receiving:

- Unique number - Unique number from csv file
- Principal - Principal from csv file
- Annual rate - Annual rate from csv file
- Interest - Principal * Annual rate

5. Unique number must be uniq. If DB record with existing Unique number present in file, Message with file name and unique number should be written to logfile “file-warnings.log”

6. If Unique number or Principal is not present in a row, error should be raised and file should not be processed.

7.  If Annual rate is not present in a row, default rate should be applied. Default rate - 44%. If default rate was applied it should be saved in DB that default rate was applied for loan.

8. Implement view page with loans list on it. * Try to use cached data

9. After file is processed message with file name should be written to logfile “file-processed.log”
