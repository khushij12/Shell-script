#Navigation. Absolute/ Relative Pathnames. Listing Directories. Creating Directories. Modifying Directories.
echo "\n\t\t\tImplementing directory management\n\n"
while [ 1 ] 
do 
	echo "\n\tMain Menu\n"
	echo "1. Navigate into other directories"
	echo "2. Change permission of directory"
	echo "3. Listing of directory"
	echo "4. Creating a new directory"
	echo "5. Modifying a directory"
	echo "6. Exit"
	echo "\nEnter your choice: "
	read choice
	if [ $choice = 1 ] 
	then
		while [ 1 ] 
		do
			echo "\n\tSub-Menu\n"
			echo "1. Move to parent directory: "
			echo "2. Move to any child directory: "
			echo "3. Move to root directory: "
			echo "4. Move to Home directory: "
			echo "5. Back to main menu\n"	
			echo "Enter your choice: "
			read c
			if [ $c = 1 ] 
			then
				cd ..
				echo "\nMoved to parent directory\n" 
			elif [ $c = 2 ] 
			then
				echo "Enter name of the directory: "
				read x
				cd $x
				echo "\nMoved to said directory\n" 
			elif [ $c = 3 ] 
			then
				cd /
				echo "\nMoved to root directory\n" 
			elif [ $c = 4 ] 
			then
				cd ~
			else
				break
			fi
			echo "Current directory: `pwd`"
		done		
	elif [ $choice = 2 ] 
	then 
		echo "Enter name of the directory: "
		read x
		echo "\nCurrent permissions of $x is `ls -ld $x`"
		echo "\nEnter permissions of directory as per new permissions: "
		echo "\nEnter permission for user(rwx): "
		read u
		echo "\nEnter permission for members of group: "
		read g
		echo "\nEnter permission for others: "
		read o
		chmod u=$u,g=$g,o=$o $x
		echo "Updated permission of $x is `ls -ld $x`"
	elif [ $choice = 3 ] 
	then 
		echo "\n\tSub-Menu\n"
		echo "1. List of all files and folders with extra information"
		echo "2. List of all files and folders without extra information"
		read c
		if [ $c = 1 ]
		then 
			ls -l
		else
			ls  
		fi
	elif [ $choice = 4 ] 
	then 
		echo "Enter name of a directory to be created: "
		read x
		mkdir $x
		echo "\n\tCreated" 
	elif [ $choice = 5 ] 
	then
		while [ 1 ] 
		do
			echo "\n\tSub-Menu\n"
			echo "1. Rename the directory"
			echo "2. Move the directory"
			echo "3. Copy the directory"
			echo "4. Delete the directory"
			echo "5. Back to main menu"
			echo "Enter your choice: "
			read c
			if [ $c = 1 ]
			then
				echo "Enter directory name: "
				read x
				echo "Enter new name of the directory: "
				read y
				mv $x $y
				echo "\tFile has been renamed"
			elif [ $c = 2 ]
			then
				echo "Enter path to source directory: "
				read x
				echo "Enter path to destination directory: "
				read y
				mv $x $y
			elif [ $c = 3 ]
			then
				echo "Enter path to source directory: "
				read x
				echo "Enter path to destination directory: "
				read y
				cp $x $y
			elif [ $c = 4 ]
			then
				echo "Enter name of the directory to be deleted: "
				read x
				rmdir $x
			else
				break
			fi
			c=0
		done
	else
		echo "Exited"
		break
	fi

done