--Lee dos 3 y dos numeros, lee el primer y segundo archivo, sobrescribe el tercero
import System.Environment --por el getArgs
import Data.List.Split
import System.CPUTime

main :: IO ()
main = do

    principioTotal <- getCPUTime
    --

    [fileA,fileB,fileC,bx,by] <- getArgs
    archivoA <- readFile fileA 
    archivoB <- readFile fileB
    --
    let linesA = lines archivoA
    let matrizA =  (read (head linesA)::Int) : (read ((head . tail) linesA)::Int) : map (\x -> read x::Int) ((init . splitOn " " . foldl1 (++) . map (\x -> x ++ " ") . tail . tail) linesA)
    --
    let linesB = lines archivoB
    let matrizB =  (read (head linesB)::Int) : (read ((head . tail) linesB)::Int) : map (\x -> read x::Int) ((init . splitOn " " . foldl1 (++) . map (\x -> x ++ " ") . tail . tail) linesB)
    --
    
    print matrizA
    print matrizB
    --

    --
    finDeTodo <- getCPUTime
    let tiempo = (fromIntegral (finDeTodo - principioTotal))/(10^9)
    putStr ("El tiempo total en milisegundos es de ")
    print tiempo