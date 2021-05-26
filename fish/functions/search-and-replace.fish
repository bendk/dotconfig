function search-and-replace --argument old new
	if test -z $old; or test -z $new;
    echo 'Usage search-and-replace [old string] [new string]'
    return 1
  else
    for file in (rg -l $old)
      echo $file
      sed -i  s/$old/$new/g $file
    end
  end
end
