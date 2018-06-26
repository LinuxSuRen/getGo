package cmd

import (
	"io/ioutil"
	"log"
	"os/exec"

	"github.com/spf13/cobra"
)

func init() {
	rootCmd.AddCommand(installCmd)
}

var installCmd = &cobra.Command{
	Use:   "k8s",
	Short: "k8s",
	Long:  "k8s",
	Run: func(cmd *cobra.Command, args []string) {
		install()
	},
}

func cmdExec(name string, cmdStr ...string) {
	cmd := exec.Command(name, cmdStr...)
	stdout, err := cmd.StdoutPipe()
	if err != nil {
		log.Fatal(err)
	}
	// 保证关闭输出流
	defer stdout.Close()
	// 运行命令
	if err := cmd.Start(); err != nil {
		log.Fatal(err)
	}
	// 读取输出结果
	opBytes, err := ioutil.ReadAll(stdout)
	if err != nil {
		log.Fatal(err)
	}
	log.Println(string(opBytes))
}

func install() {
	cmdExec("apt-get", "update")
	cmdExec("apt-get", "install", "python", "-y")
}
